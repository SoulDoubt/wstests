#ifndef _SQL_H_
#define _SQL_H_

#include <JsonBox.h>
#include <sqlite3.h>

#define DEBUG_SQLITE_DB_PATH "/home/al/test.db"

namespace Accutron
{

class SQLDatabase
{
public:
    SQLDatabase();
    virtual ~SQLDatabase();
    JsonBox::Array ExecuteQuery(const std::string& sql);

    bool IsOpen(){
        return m_isOpen;
    }
    
    std::string GetError(){
        return m_errorString;
    }

private:
    sqlite3* m_db = nullptr;
    bool m_isOpen;
    std::string m_errorString;
};
}

#endif
