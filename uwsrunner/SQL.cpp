#include <SQL.h>

namespace Accutron
{

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
        retval.push_back(o);
    }
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

int SQLDatabase::ExecuteRawStatement(const std::string& sql){    
    char* dbError = nullptr;
    int rc = sqlite3_exec(m_db, sql.c_str(), nullptr, nullptr, &dbError);
    if (dbError){
        sqlite3_free(dbError);
    }
    return rc;
}

} // Accutron