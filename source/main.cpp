/*
 * Include global libs
 */
#include <QGuiApplication>
#include <QQmlApplicationEngine>

/*
 * Include local libs
 */
#include "core.h"

int main(int argc, char *argv[])
{
    /*
     * Run application Qt quick
     */
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    /*
     * Initializing c++ classes to qt quick libs
     */

    qmlRegisterType<Core>("CoreApi", 0, 1, "CoreApi");

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
