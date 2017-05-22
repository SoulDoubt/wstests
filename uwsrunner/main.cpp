#include <stdio.h>
#include <thread>
#include <iostream>
#include <algorithm>
#include <string>
#include <sstream>

#include <uWS/uWS.h>
#include "JsonBox.h"
#include <JsonBox/Convert.h>

#include <SQL.h>

#define DEBUG_SQLITE_DB_PATH "/home/al/test.db"

static int db_callback(void* NotUsed, int argc, char** argv, char** azColName)
{
    int i;
    for(i = 0; i < argc; i++) {
        printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
    }
    printf("\n");
    return 0;
}

bool DatabaseExists(const char* path)
{
    bool exists = false;
    if(auto fp = fopen(path, "r")) {
        exists = true;
        fclose(fp);
    }
    return exists;
}

bool CreateDatabase(const char* path)
{

    sqlite3* db;
    char* errorMessage = nullptr;
    int rc = sqlite3_open(path, &db);
    if(rc) {
        std::cout << "Damn, database connection failed" << std::endl;
        return false;
    } else {
        std::cout << "Database Connection successful." << std::endl;
    }

    const char* sql = "CREATE TABLE Users("
                      "ID             INT         PRIMARY KEY     NOT NULL,"
                      "UserName       VARCHAR(64)                 NOT NULL,"
                      "Permissions    VARCHAR(8)                  NOT NULL,"
                      "FloatVal       FLOAT                       NOT NULL)";

    rc = sqlite3_exec(db, sql, db_callback, nullptr, &errorMessage);
    if(rc != SQLITE_OK) {
        fprintf(stdout, "SQL error: %s\n", errorMessage);
        sqlite3_free(errorMessage);
        return false;
    }

    std::cout << "Users Table Created..." << std::endl;

    const char* isql = "INSERT INTO Users ("
                       "ID, UserName, Permissions, FloatVal) VALUES ("
                       "1, 'Allan', 'rwx', 3.76575);"
                       "INSERT INTO Users ("
                       "ID, UserName, Permissions, FloatVal) VALUES ("
                       "2, 'Mike', 'rwx', 4.5498);"
                       "INSERT INTO Users ("
                       "ID, UserName, Permissions, FloatVal) VALUES ("
                       "3, 'Richard', 'r-x', 764.78263);"
                       "INSERT INTO Users ("
                       "ID, UserName, Permissions, FloatVal) VALUES ("
                       "4, 'Doug', 'r--', 564.8674);";

    rc = sqlite3_exec(db, isql, db_callback, nullptr, &errorMessage);
    if(rc != SQLITE_OK) {
        fprintf(stdout, "SQL error: %s\n", errorMessage);
        sqlite3_free(errorMessage);
        return false;
    }
    sqlite3_close(db);
    return true;
}

struct User
{
    int id;
    std::string name;
    std::string permissions;
};

int main(int argc, char** argv)
{
    if(!DatabaseExists(DEBUG_SQLITE_DB_PATH)) {
        CreateDatabase(DEBUG_SQLITE_DB_PATH);
    }

    auto t = new std::thread([]() {
        uWS::Hub h;

        h.onConnection([](uWS::WebSocket<uWS::SERVER>* ws, uWS::HttpRequest request) {
            std::cout << "Connection made to: " << request.getUrl().toString() << std::endl;
        });

        h.onMessage([](uWS::WebSocket<uWS::SERVER>* ws, char* message, size_t length, uWS::OpCode opCode) {
            char* msgBuff = new char[length];
            strncpy(msgBuff, message, length);
            std::string msgstr = std::string(msgBuff);
            delete msgBuff;
            // std::cout << "Message Begins..." << std::endl;
            // std::cout << msgstr << std::endl;
            // std::cout << "Message Ends..." << std::endl;

            // auto json = JsonBox::Convert::decodeUTF8(msgstr);
            JsonBox::Value json;
            json.loadFromString(msgstr);
            auto o = json.getObject();
            auto commandval = o["command"];
            std::string commandstr;
            if(commandval.isString()) {
                commandstr = commandval.getString();
            }

            // we are in a thread and must create our own DB whenever needed...
            Accutron::SQLDatabase db;
            if(db.IsOpen()) {
                auto users = db.ExecuteSelectQuery("SELECT * FROM Users");
                std::stringstream ss;
                ss << users;
                std::string resultstring = ss.str();
                ws->send(resultstring.c_str(), resultstring.size(), opCode);
            } else{
                std::string err = db.GetError();
                ws->send(err.c_str(), err.size(), opCode);
            }
        });

        // This makes use of the SO_REUSEPORT of the Linux kernel
        // Other solutions include listening to one port per thread
        // with or without some kind of proxy inbetween
        if(!h.listen(3000, nullptr, uS::ListenOptions::REUSE_PORT)) {
            std::cout << "Failed to listen" << std::endl;
        }
        h.run();
    });

    t->join();

    if(t)
        delete t;
}
