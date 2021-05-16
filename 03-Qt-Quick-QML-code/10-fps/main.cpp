#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "fpslabel.h"
#include <QSurfaceFormat>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    // 关闭垂直同步/在windows上不好用
    QSurfaceFormat format = QSurfaceFormat::defaultFormat();
    format.setSwapInterval(0);
    QSurfaceFormat::setDefaultFormat(format);

    // 注册控件
    qmlRegisterType<FPSLabel>("DisPlayFPS", 1, 0, "FPSLabel");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
