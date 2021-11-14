#include "calfps.h"

CalFps::CalFps()
{
    m_fpsFrequency = 0;
    m_window = nullptr;

   connect(m_window, &QQuickWindow::afterRendering, this, &CalFps::calculation);
}


void CalFps::calculation(){
    m_fpsFrequency++;
}



