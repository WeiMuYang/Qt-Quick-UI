#ifndef QMLWIDGET_H
#define QMLWIDGET_H

#include <QWidget>
#include <QQuickWidget>
#include <QQmlEngine>
#include <QVBoxLayout>

class QmlWidget : public QWidget
{
    Q_OBJECT
public:
    explicit QmlWidget(QWidget *parent = nullptr);

private:
    QVBoxLayout * layout;
    QQuickWidget * quickWidget;
signals:
    void sigWidget(void);
public slots:
    void slotWidget(void);
    void btnClicked(void);
};

#endif // QMLWIDGET_H
