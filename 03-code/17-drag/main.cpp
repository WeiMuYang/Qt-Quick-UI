#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "fpslabel.h"
#include <QSurfaceFormat>
#include <QtOpenGL/QGLFormat>
#include "calfps.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    // 关闭垂直同步/在windows上不好用
    QSurfaceFormat format = QSurfaceFormat::defaultFormat();
    format.setSwapInterval(0);
    QSurfaceFormat::setDefaultFormat(format);

//    QGLFormat GLformat;
//    GLformat.setVersion(3,3);
//    GLformat.setProfile(QGLFormat::CoreProfile);
//    QOPenGL
//    QGLFormat::setFormat(GLformat);



    // 注册控件
    qmlRegisterType<FPSLabel>("DisplayFps", 1, 0, "FPSLabel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject *topLevel = engine.rootObjects().value(0);

    CalFps calFps(qobject_cast<QQuickWindow *>(topLevel), nullptr);


    calFps.m_window->show();

    return app.exec();
}
