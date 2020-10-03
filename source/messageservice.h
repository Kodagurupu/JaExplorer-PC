#ifndef MESSAGESERVICE_H
#define MESSAGESERVICE_H

#include <QObject>

class MessageService : public QObject
{
    Q_OBJECT
public:
    explicit MessageService(QObject *parent = nullptr);

signals:

};

#endif // MESSAGESERVICE_H
