#ifndef CALFPS_H
#define CALFPS_H

#include <QObject>
#include <QQuickWindow>

/**
* Copyright (c)  2021 YWB. All rights reserved
* @projectName   11-drag
* @file          calfps.h
* @brief         摘要
* @author        Yang Weibin
* @date          2021-05-30 19:50:37
*/


class CalFps : public QObject
{
    Q_OBJECT
public:
    explicit CalFps(QQuickWindow *w, QObject *parent);

    int getFpsFrequency(){
        return m_fpsFrequency;
    }
    QQuickWindow *m_window;

public slots:
    void calculation();
private:
    int m_fpsFrequency;

    int m_value = -1;
    int m_cacheCount = 0;
    QVector<qint64> m_frames;
};

#endif // CALFPS_H
