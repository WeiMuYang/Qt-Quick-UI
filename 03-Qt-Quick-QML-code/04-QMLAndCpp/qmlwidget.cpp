#include "qmlwidget.h"
#include <QDebug>
#include <QPushButton>

/**
* Copyright (c)  2021 YWB. All rights reserved
* @projectName   04-QMLAndCpp
* @file          qmlwidget.cpp
* @brief         将main.qml嵌入到widget   https://www.cnblogs.com/lvdongjie/p/13536603.html
* @author        Yang Weibin
* @date          2021-01-08 11:49:50
*/

QmlWidget::QmlWidget(QWidget *parent) : QWidget(parent)
{
    quickWidget = new QQuickWidget();
    quickWidget->setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    layout = new QVBoxLayout(this);
    QPushButton *btn1 = new QPushButton(this);
    btn1->setText("widget btn");
    layout->addWidget(btn1);
    connect(btn1,SIGNAL(clicked(bool)),this,SLOT(btnClicked()));
    QObject * obj = (QObject*)quickWidget->rootObject();
    connect(obj,SIGNAL(qmlClicked()),this,SLOT(slotWidget()));
    connect(this,SIGNAL(sigWidget()),obj,SIGNAL(widgetClicked()));
    quickWidget->setLayout(layout);
    quickWidget->show();
}

void QmlWidget::slotWidget() {
    qDebug()<<"qml sig to widget slot";
    emit sigWidget();
}
void QmlWidget::btnClicked() {
    qDebug()<<"widget btn clicked";
}
