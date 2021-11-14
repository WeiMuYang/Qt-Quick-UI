# QML显示FPS     

## 概述  

最近在做一个新窗管的QML测试，在测试过程中，需要进行帧率的刷新对比，因此需要求得FPS。FPS的重要影响因素：显卡、CPU、显示器、内存。

> ##### FPS（每秒传输帧数(Frames Per Second)） 是速度单位
>
> 1fps=0.304meter/sec(米/秒)
>
> 刷新频率越低，图像闪烁和抖动的就越厉害，眼睛疲劳得就越快。

## 计算原理  

根据FPS的定义，只需要求得一秒内更新数据帧的次数，也就是调用paint的次数即可。

## 代码实现    

### 1 求FPS 

```C++
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
```

### 2 刷新  

```C++
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
```




## 参考资料 
1. https://blog.csdn.net/zzs0829/article/details/103598084     
2. https://www.cnblogs.com/-Donny/p/5077735.html  
3. https://blog.csdn.net/haohaohaihuai/article/details/106422652  
4. https://blog.csdn.net/qq_37996632/article/details/113780628  