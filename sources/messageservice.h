#pragma once

#include <QDebug>
#include <QObject>

class MessageService : public QObject
{
    Q_OBJECT
public:
    MessageService(QObject * parent = nullptr);

public slots:
    void reciveMessage(QString);
};
