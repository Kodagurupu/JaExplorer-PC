#pragma once

#include <QDir>
#include <QtSql>
#include <QObject>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>

#include "messageservice.h"
#include "sqlTables.h"

class Database : public QObject
{
    Q_OBJECT
signals:
    void reciveMessage(QString message);

public:
    explicit Database(QObject *parent = nullptr);

    QJsonArray getRadio();

private:
    void checkDatabase();

    MessageService console;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

};
