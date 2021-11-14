# [基于Qt的DBus信号的用法-上](./)  [img](./img)     

> ######  _标签:_   ![](https://img.shields.io/badge/技术类-yellowgreen.svg) ![](https://img.shields.io/badge/DBus通信-qt-blue.svg) [![](https://img.shields.io/badge/链接-IPC进程间通信之QtDBus快速入门-brightgreen.svg)](https://www.cnblogs.com/sparkFY/p/14973726.html) [![](https://img.shields.io/badge/链接-代码文件-orange.svg)](../03-code/)        
>

## 1 QtDBus简介  

QtDBus是一个使用D-Bus协议进行进程间通信的仅在Unix运行的库，是对D-Bus底层API的封装实现。
QtDBus模块提供了使用Qt信号槽机制扩展的接口。要使用QtDBus模块，需要在头文件中加入以下代码：  

```C++
// xx.cpp
#include <QtDBus>
```
在pro文件中需要将添加qdbus模块  
```shell
QT += qdbus
QT += dbus
# 对于一些其他的编译环境，可能是 QT += dbus后编译通过。
```

## 2 数据类型 

- 基本数据类型  
- QtDBus通过QDBusArgument支持原生类型  

Qt类型|D-Bus类型|Qt类型|D-Bus类型
:-:|:-:|:-:|:-:
uchar|BYTE|bool|BOOLEAN
short|INT16|ushort|UINT16
int|INT32|uint|UINT32
qlonglong|INT64|qulonglong|UINT64
double|DOUBLE|QString|STRING
QDBusVariant|VARIANT|QDBusObjectPath|OBJECT_PATH
QDBusSignature|SIGNATURE||

- 除了原生类型，QDBusArgument也支持在Qt应用中广泛使用的两种非原生类型，QStringList和QByteArray。  

- 复合类型：ARRAY、STRUCT和 maps/dictionaries   
- 类型系统：自定义类型必须使用Q_DECLARE_METATYPE( )声明为Qt元类型，使用qDBusRegisterMetaType( )函数注册   
- 扩展类型：QtDBus定义的所有类型能用于通过总线发送和接收消息。不能使用上述类型之外的任何类型   

## 3 D-Bus常用类  
- QDBusMessage：表示D-Bus总线发送或接收的一个消息。
- QDBusConnection：代表到D-Bus总线的一个连接，是一个D-Bus会话的起始点。通过QDBusConnection连接对象，可以访问远程对象、接口，连接远程信号到本地槽函数，注册对象等。  
- connectToBus：D-Bus支持点对点通信，不必使用总线服务。两个应用程序可以直接交流和交换消息。可以通过传递一个地址到connectToBus()函数实现。   
```C++
// 1. 打开一个type类型的连接，并关联name连接名，返回关联本连接的QDBusConnection对象。
QDBusConnection connectToBus(BusType type, const QString & name)

// 2. 打开一个地址为address的私有总线，并关联name连接名，返回关联本连接的QDBusConnection对象。
QDBusConnection connectToBus(const QString & address, const QString & name)

// 3. 打开一个点对点的连接到address地址，并关联name连接名，返回关联本连接的QDBusConnection对象。
QDBusConnection connectToPeer(const QString & address, const QString & name)

// 4. 关闭名为name的总线连接
void disconnectFromBus(const QString & name)

// 5. 关闭名为name的对等连接
void disconnectFromPeer(const QString & name)

// 6. 返回一个D-Bus总线系统知道的本机ID
QByteArray localMachineId()

// 7. 返回发送信号的连接
QDBusConnection sender()

// 8. 返回一个打开到session总线的QDBusConnection对象
QDBusConnection sessionBus()

// 9. 返回一个打开到system总线的QDBusConnection对象
QDBusConnection systemBus()

// 10. 发送message消息到连接，并立即返回。本函数只支持method调用。返回一个用于追踪应答的QDBusPendingCall对象。
QDBusPendingCall asyncCall(const QDBusMessage & message, int timeout = -1)const

// 11. 通过本连接发送消息message，并且阻塞，等待应答。
QDBusMessage call(const QDBusMessage & message, QDBus::CallMode mode = QDBus::Block, int timeout = -1 ) const

// 12. 注册object对象到路径path，options选项指定由多少对象会被暴露到D-Bus总线，如果注册成功，返回true。
bool registerObject(const QString & path, QObject * object, RegisterOptions options = ExportAdaptors)

// 13. 试图在D-Bus总线上注册serviceName服务，如果注册成功，返回true；如果名字已经在其它应用被注册，则注册失败。
bool registerService(const QString & serviceName)
```

- QDBusInterface：远程对象接口的代理。是一种通用的访问器类，用于调用远程对象，连接到远程对象导出的信号，获取/设置远程属性的值。当没有生成表示远程接口的生成代码时时，QDBusInterface类对远程对象的动态访问非常有用。   
- QDBusReply：用于存储对远程对象的方法调用的应答。  
- QDBusAbstractAdaptor：使用D-Bus Adaptor基类。是用于**使用D-Bus向外部提供接口的所有对象的起点**。可以通过将一个或多个派生自QDBusAbstractAdaptor的类附加到一个普通QObject对象上，使用QDBusConnection::registerObject注册QObject对象可以实现。    
- QDBusAbstractInterface：是QtDBus模块中允许访问远程接口的所有D-Bus接口的基类。   
- QDBusArgument：于整理和分发D-Bus参数。QDBusArgument用于通过D-Bus发送参数到远程应用，并接收返回。   
- QDBusConnectionInterface：供了对D-Bus总线服务的访问。   
- QDBusVariant：使程序员能够识别由D-Bus类型系统提供的Variant类型。   
