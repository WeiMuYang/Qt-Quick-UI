#ifndef CALFPS_H
#define CALFPS_H

#include <QObject>
#include <QQuickWindow>

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
};

#endif // CALFPS_H
