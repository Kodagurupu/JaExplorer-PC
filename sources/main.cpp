#include <QApplication>
#include <QQmlApplicationEngine>
#include "databaseApi.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QApplication::setWindowIcon(QIcon(":/assets/Images/programLogo.png"));

    qmlRegisterType<DatabaseApi>("Database", 1, 0, "Database");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/assets/Forms/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
