#include "fpslabel.h"
#include <QPainter>
#include <QDateTime>
#include <QDebug>

FPSLabel::FPSLabel(QQuickItem *parent): QQuickPaintedItem(parent)
{
    setFlag(QQuickItem::ItemHasContents);
}


void FPSLabel::refreshFPS()
{
    // 1 当前时间：单位  msec  毫秒
    qint64 currentTime = QDateTime::currentDateTime().toMSecsSinceEpoch();
    m_frames.push_back(currentTime);  // 获取计算机的时间，并存入容器

    // 2 如果当前时间和容器中 0号位置的时间相差超过 1秒  就将其移除，保证都是1秒内的时间
    while (m_frames[0] < (currentTime - 1000)) {
        m_frames.pop_front();
    }

    // 3 获取当前的容器长度：一秒内调用的次数
    int currentCount = m_frames.length();

    // 4 (这一秒调用的次数 + 上一秒内调用次数) / 2
    m_value = (currentCount + m_cacheCount) / 2;

    // 5 如果当前的调用次数和上一秒的调用次数不相等，则发信号更新value值
    if (currentCount != m_cacheCount) {
        emit valueChanged(m_value);
    }

    // 6 将当前的调用次数存入m_cacheCount，作为下一秒计算的参数
    m_cacheCount = currentCount;
}

int FPSLabel::value() const
{
    return m_value;
}

// paint是父类 QQuickPaintedItem 中的虚函数，在子类中进行了重写
// paint 在每次重绘和发生变化时，都会进行调用
void FPSLabel::paint(QPainter *painter)
{
    refreshFPS();

    QBrush brush(Qt::yellow);
    painter->setBrush(brush);
    painter->setRenderHint(QPainter::Antialiasing);
    painter->drawRoundedRect(0, 0, boundingRect().width(), boundingRect().height(), 0, 0);

    QFont font = painter->font();
    font.setPixelSize(qMin(width(), height()) * 0.6);
    painter->setFont(font);
    QPen pen = painter->pen();
    pen.setColor(Qt::red);
    painter->setPen(pen);
    painter->drawText(boundingRect(), Qt::AlignCenter, QString("FPS:%1").arg(m_value));

    // 用于更新窗体部件，它规划了所要处理的绘制事件。
    update();  // 调用重绘 → paint
}
