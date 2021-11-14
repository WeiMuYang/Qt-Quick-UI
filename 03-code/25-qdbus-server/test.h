#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QtDBus>

class test : public QObject
{
    Q_OBJECT
    // 这里定义的是DBus连接的接口，client需要这个
    // "spark.test.interface"接口对DBus服务进行访问。
    Q_CLASSINFO("D-Bus Interface", "spark.test.interface")
public:
    explicit test(QObject *parent = nullptr);
    test(int value);

signals:
public slots:
    void set_value(int value);
    int get_value();
private:
    int m_value;

};

#endif // TEST_H
