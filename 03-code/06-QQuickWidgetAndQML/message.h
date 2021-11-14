#ifndef MESSAGE_H
#define MESSAGE_H

#include <QObject>

/**
* Copyright (c)  2021 YWB. All rights reserved
* @projectName   05-QQuickWidgetAndQML
* @file          message.h
* @brief         QML可以直接访问类的属性，只需通过Q_PROPERTY暴露接口即可
* @author        Yang Weibin
* @date          2021-01-10 14:44:02
*/

typedef struct Data{
    int a;
    int b;
    int c;
} Data;



class Message : public QObject
{
    Q_OBJECT
    //     1.类的数据成员,不一定是成员名   2. 读取属性信息函数  3. 写入到属性信息     4. 属性改变时需要发出的信号
            // 在QML中使用的属性名
    Q_PROPERTY(QString author      READ getAuthor      WRITE setAuthor     NOTIFY authorChanged)
    Q_PROPERTY(QString data   READ getData      WRITE setData     NOTIFY dataChanged)
    Q_PROPERTY(QString arr    READ getArr  WRITE setArr   NOTIFY arrChanged)

public:
    explicit Message(QObject *parent = nullptr);
private:
    // 1. 类的数据成员
    QString m_str_author;
    Data m_data;
    int m_n_arr[3];

public:
    // 2. 读取属性信息函数
    QString getAuthor() const {
        return m_str_author;
    }
    // 3. 写入属性信息，并发射信号
    void setAuthor(const QString& a) {
        if(a != m_str_author) {
            m_str_author = a;
            emit authorChanged();    // 发出信号
        }
    }
    Data getData(){

    }
signals:
    // 4. 属性改变时，需要发出的信号
    void  authorChanged();
};

#endif // MESSAGE_H
