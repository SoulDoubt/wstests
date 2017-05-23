#ifndef _SQL_H_
#define _SQL_H_

#include <JsonBox.h>
#include <sqlite3.h>

#define DEBUG_SQLITE_DB_PATH "/home/al/test.db"

namespace Accutron
{

class SQLParameter
{
public:
    enum SQL_TYPE { TEXT, INT, FLOAT, REAL, BOOL };
    union ParamValue
    {
        int intval;
        float floatval;
        double doubleval;
        char* stringval;
    } value;    
    SQL_TYPE type;
    
    SQLParameter(){}
    SQLParameter(int val) : type(SQL_TYPE::INT) {
        value.intval = val;
    }
    
    SQLParameter(float val) : type(SQL_TYPE::FLOAT) {
        value.floatval = val;
    }
    
    SQLParameter(double val) : type(SQL_TYPE::REAL){
        value.doubleval = val;
    }
    
    SQLParameter(const std::string& val) : type(SQL_TYPE::TEXT){
        value.stringval = const_cast<char*>(val.c_str());
    }
    
    
};

class SQLDatabase
{
public:
    SQLDatabase();
    virtual ~SQLDatabase();

    JsonBox::Array ExecuteSelectQuery(const std::string& sql);
    JsonBox::Array ExecuteSelectQuery(const std::string& sql, const std::vector<SQLParameter>& params);
    int ExecuteNonQuery(const std::string& sql);
    int ExecuteNonQuery(const std::string& sql, const std::vector<SQLParameter>& params);
    int ExecuteRawStatement(const std::string& sql);

    bool IsOpen()
    {
        return m_isOpen;
    }

    std::string GetError()
    {
        return m_errorString;
    }

private:
    sqlite3* m_db = nullptr;
    bool m_isOpen;
    std::string m_errorString = std::string();
};
}

#endif
