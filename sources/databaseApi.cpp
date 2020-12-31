/*
 * Include local libs
 */
#include "databaseApi.h"

DatabaseApi::DatabaseApi(QObject *parent) : QObject(parent)
{

}

QJsonArray DatabaseApi::getRadio()
{
    QJsonArray radioStations = db.getRadio();
    radioModel = radioStations;

    emit radioModelChanged(radioStations);
    return radioStations;
}

QJsonArray DatabaseApi::getRadioModel()
{
    return radioModel;
}

QJsonArray DatabaseApi::getKana()
{
    QJsonArray kanaSymbols = db.getKana();
    kanaModel = kanaSymbols;

    emit kanaModelChanged(kanaSymbols);
    return kanaSymbols;
}

QJsonArray DatabaseApi::getKanaModel()
{
    return kanaModel;
}
