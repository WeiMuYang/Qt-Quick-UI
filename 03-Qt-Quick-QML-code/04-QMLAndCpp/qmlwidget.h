#ifndef QMLWIDGET_H
#define QMLWIDGET_H

#include <QWidget>

class QmlWidget : public QWidget
{
    Q_OBJECT
public:
    explicit QmlWidget(QWidget *parent = nullptr);

signals:

public slots:
};

#endif // QMLWIDGET_H