#ifndef MESSAGESERVICE_H
#define MESSAGESERVICE_H

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

#endif // MESSAGESERVICE_H
