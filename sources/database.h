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

public:
    explicit Database(QObject *parent = nullptr);

    QJsonArray getKana();
    QJsonArray getRadio();

signals:
    void reciveMessage(QString message);

private:
    MessageService console;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");

    void checkDatabase();
};
