#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QObject>
#include "calfps.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);



    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *topLevel = engine.rootObjects().value(0);

    CalFps calFps;
    calFps.m_window = qobject_cast<QQuickWindow *>(topLevel);



    calFps.m_window->show();

    return app.exec();
}
