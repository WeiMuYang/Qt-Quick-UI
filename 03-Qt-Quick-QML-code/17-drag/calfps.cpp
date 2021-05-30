#include "calfps.h"
#include <QDebug>
#include <QDateTime>

CalFps::CalFps(QQuickWindow *w, QObject *parent)
  : QObject(parent), m_window(w)
{

    m_fpsFrequency = 0;

   connect(m_window, &QQuickWindow::afterRendering, this, &CalFps::calculation);
}

void CalFps::calculation(){

    qint64 currentTime = QDateTime::currentDateTime().toMSecsSinceEpoch();
    m_frames.push_back(currentTime);

    while (m_frames[0] < (currentTime - 1000)) {
        m_frames.pop_front();
    }

    int currentCount = m_frames.length();
    m_value = (currentCount + m_cacheCount) / 2;

    if (currentCount != m_cacheCount) {
        qDebug() << "FPS: " << m_value;
    }

    m_cacheCount = currentCount;
}
