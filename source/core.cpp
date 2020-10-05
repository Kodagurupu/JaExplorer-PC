/*
 * Include local libs
 */
#include "core.h"

Core::Core(QObject *parent) : QObject(parent)
{

}

QJsonArray Core::getRadio()
{
    return db.getRadio();
}
