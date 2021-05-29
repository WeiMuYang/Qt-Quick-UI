#include "calfps.h"
#include <QDebug>

CalFps::CalFps(QQuickWindow *w, QObject *parent)
  : QObject(parent), m_window(w)
{

    m_fpsFrequency = 0;

   connect(m_window, &QQuickWindow::afterRendering, this, &CalFps::calculation);
}


void CalFps::calculation(){
    m_fpsFrequency++;
    qDebug() <<m_fpsFrequency;
}
