#ifndef FPSLABEL_H
#define FPSLABEL_H

#include <QObject>
#include <QQuickItem>
#include <QQuickPaintedItem>
#include <QVector>

class FPSLabel : public QQuickPaintedItem
{
    Q_OBJECT
    // 声明一个可以在qml中访问的属性  value  可读   触发变化的信号
    Q_PROPERTY(int value READ value NOTIFY valueChanged)
public:
    explicit FPSLabel(QQuickItem *parent = nullptr);


    int value() const;       // 属性的类型

    void paint(QPainter *);

signals:
    void valueChanged(int); // 触发变化的信号

public slots:

private:
    void refreshFPS();
    int m_value = -1;
    int m_cacheCount = 0;
    QVector<qint64> m_frames;
};

#endif // FPSLABEL_H
