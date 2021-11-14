#include <QDBusMessage>
#include <QDBusConnection>
#include <QDBusInterface>
#include <QDBusReply>
#include <QDebug>

int main(int argc, char *argv[])
{
    // 创建QDBusInterface接口
    QDBusInterface interface("spark.test", "/test/test_objects",
                             "spark.test.interface",
                             QDBusConnection::sessionBus());
    if (!interface.isValid())  {
        QString mes = QDBusConnection::sessionBus().lastError().message();
        qWarning() << QObject::tr("lastError = %1").arg(mes);
        exit(1);
    }

    // 调用远程的get_value方法。
    // Todo: set_value带参数方法测试无效，需进一步研究
    QDBusReply<int> reply = interface.call("get_value");
    if (reply.isValid()) {
        int value = reply.value();
        qWarning() << QObject::tr("value = %1").arg(value);
    } else{
        qWarning() << QObject::tr("value method called failed!");
    }

    interface.call( "set_value", 2 );

    return 0;
}
