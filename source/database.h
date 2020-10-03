#ifndef DATABASE_H
#define DATABASE_H

#include <QDir>
#include <QtSql>
#include <QObject>

#include "messageservice.h"
#include "SqlTables.h"

class Database : public QObject
{
    Q_OBJECT
signals:
    void reciveMessage(QString message);

public:
    explicit Database(QObject *parent = nullptr);

private:
    void checkDatabase();

    MessageService console;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

};

#endif // DATABASE_H
