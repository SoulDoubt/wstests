#include <SQL.h>

namespace Accutron
{

static void BindParameters(const std::vector<SQLParameter>& params, sqlite3_stmt* stmt)
{
    for(int i = 1; i <= static_cast<int>(params.size()); ++i) {
        auto& param = params[i - 1];
        switch(param.type) {
        case SQLParameter::SQL_TYPE::INT:
        case SQLParameter::SQL_TYPE::BOOL:
            sqlite3_bind_int(stmt, i, param.value.intval);
            break;
        case SQLParameter::SQL_TYPE::REAL:
        case SQLParameter::SQL_TYPE::FLOAT:
            sqlite3_bind_double(stmt, i, param.value.floatval);
            break;
        case SQLParameter::SQL_TYPE::TEXT:
            sqlite3_bind_text(stmt, i, param.value.stringval, -1, SQLITE_STATIC);
        }
    }
}

static void PackageResultset(sqlite3_stmt* stmt, JsonBox::Array* results){
    int rc;
    while((rc = sqlite3_step(stmt)) == SQLITE_ROW) {
        JsonBox::Object o;
        int colCount = sqlite3_column_count(stmt);
        for(int i = 0; i < colCount; ++i) {
            auto colName = std::string(sqlite3_column_name(stmt, i));
            auto typ = std::string(sqlite3_column_decltype(stmt, i));
            if(typ == "INT" || typ == "INTEGER" || typ == "TINYINT") {
                o[colName] = sqlite3_column_int(stmt, i);
            } else if(typ.find("VARCHAR") == 0 || typ.find("NVARCHAR") == 0) {
                o[colName] = std::string((const char*)sqlite3_column_text(stmt, i));
            } else if(typ == "TEXT") {
                o[colName] = sqlite3_column_text(stmt, i);
            } else if(typ == "FLOAT" || typ == "REAL" || typ == "DOUBLE") {
                o[colName] = sqlite3_column_double(stmt, i);
            }
        }
        results->push_back(o);
    }
}


SQLDatabase::SQLDatabase()
{
    int rc = sqlite3_open(DEBUG_SQLITE_DB_PATH, &m_db);
    if(rc != SQLITE_OK) {
        std::string error = "Can't open database: " + std::string(sqlite3_errmsg(m_db));
        std::cout << error << std::endl;
        m_isOpen = false;
        m_errorString = error;
    }
    m_isOpen = true;
}

SQLDatabase::~SQLDatabase()
{
    if(m_db != nullptr) {
        int rc = sqlite3_close(m_db);
        if(rc != SQLITE_OK) {
            std::cout << "SQLite did not shutdown correctly." << std::endl;
        }
    }
}

JsonBox::Array SQLDatabase::ExecuteSelectQuery(const std::string& sql)
{
    sqlite3_stmt* stmt;
    const char* sqlc = sql.c_str();
    sqlite3_prepare_v2(m_db, sqlc, -1, &stmt, nullptr);
    JsonBox::Array retval;
    PackageResultset(stmt, &retval);
    sqlite3_finalize(stmt);
    return retval;
}

JsonBox::Array SQLDatabase::ExecuteSelectQuery(const std::string& sql, const std::vector<SQLParameter>& params)
{
    sqlite3_stmt* stmt;
    const char* sqlc = sql.c_str();
    sqlite3_prepare_v2(m_db, sqlc, -1, &stmt, nullptr);
    BindParameters(params, stmt);
    JsonBox::Array retval;
    PackageResultset(stmt, &retval);
    sqlite3_finalize(stmt);
    return retval;
}

int SQLDatabase::ExecuteNonQuery(const std::string& sql)
{
    sqlite3_stmt* stmt;
    const char* sqlc = sql.c_str();
    sqlite3_prepare_v2(m_db, sqlc, -1, &stmt, nullptr);
    int rc = sqlite3_step(stmt);
    if(rc != SQLITE_DONE) {
        std::cout << "ERROR Executing non-query: " << sqlite3_errmsg(m_db) << std::endl;
    }
    sqlite3_finalize(stmt);
    return 1;
}

int SQLDatabase::ExecuteRawStatement(const std::string& sql)
{
    char* dbError = nullptr;
    int rc = sqlite3_exec(m_db, sql.c_str(), nullptr, nullptr, &dbError);
    if(rc != SQLITE_OK) {
        this->m_errorString = std::string(dbError);
        std::cout << "Error executin raw SQL statement: " << m_errorString << std::endl;
        sqlite3_free(dbError);
        return -1;
    }
    return 0;
}

int SQLDatabase::ExecuteNonQuery(const std::string& sql, const std::vector<SQLParameter>& params)
{
    sqlite3_stmt* stmt;
    sqlite3_prepare_v2(m_db, sql.c_str(), sql.size(), &stmt, nullptr);
    BindParameters(params, stmt);
    int rc = sqlite3_step(stmt);
    if(rc != SQLITE_DONE) {
        std::cout << "ERROR Executing non-query: " << sqlite3_errmsg(m_db) << std::endl;
        sqlite3_finalize(stmt);
    }
    sqlite3_finalize(stmt);
    return 1;
    
}

} // Accutron