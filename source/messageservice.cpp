#include "messageservice.h"

MessageService::MessageService(QObject *parent)
    : QObject(parent)
{
}

void MessageService::reciveMessage(QString message)
{
    qDebug() << message;
}
