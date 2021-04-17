#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QNetworkConfigurationManager>
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QNetworkConfigurationManager mgr;
    connect(&mgr, &QNetworkConfigurationManager::onlineStateChanged,this, [=](bool isOnline){
        qDebug()<<"网络已经更改"<<isOnline;
    });
}

MainWindow::~MainWindow()
{
    delete ui;
}
