#pragma once

#include <QObject>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>

#include "database.h"

class DatabaseApi : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QJsonArray kanaModel READ getKanaModel NOTIFY kanaModelChanged)
    Q_PROPERTY(QJsonArray radioModel READ getRadioModel NOTIFY radioModelChanged)

signals:
    void kanaModelChanged(QJsonArray);
    void radioModelChanged(QJsonArray);

public:
    explicit DatabaseApi(QObject *parent = nullptr);

    Q_INVOKABLE QJsonArray getKana();
    Q_INVOKABLE QJsonArray getRadio();

private:
    Database db;

    QJsonArray kanaModel;
    QJsonArray getKanaModel();

    QJsonArray radioModel;
    QJsonArray getRadioModel();
};
