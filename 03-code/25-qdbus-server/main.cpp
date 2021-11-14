#include <QCoreApplication>
#include <QDBusConnection>
#include <QDebug>
#include <QDBusError>
#include "test.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // 建立到session bus的连接
    QDBusConnection connection = QDBusConnection::sessionBus();
    // 在session bus上注册名为spark.test的服务
    // spark.test是服务的名字，注意和test.h中的接口名字spark.test.interface区别
    if(!connection.registerService("spark.test"))
    {
        qDebug() << "error:" << connection.lastError().message();
        exit(-1);
    }
    test test_object(60);
    // 注册名为/test/test_objects的对象，把类Object所有槽函数导出为object的method
    connection.registerObject("/test/test_objects", &test_object, QDBusConnection::ExportAllSlots);

    return a.exec();
}
