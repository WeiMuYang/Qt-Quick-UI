#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include "message.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QQmlContext* pContext = ui->quickWidget->engine()->rootContext();
    // 1. 基本类型
    int ziFuIr = 30;
    pContext->setContextProperty("ziFuIr",ziFuIr);

    // 2. ListView + QStringList作为model 不适合传值
    //    QStringList list;
    //    list << "整型" << "字符串" << "文件";
    //    pContext->setContextProperty("stringListModel",QVariant::fromValue(list));

    // 3. Q_PROPERTY宏定义
    m_pMessage = new Message;
    m_pMessage->setParent(this);
    m_pMessage->setAuthor("整型");
    pContext->setContextProperty("msg", m_pMessage);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    QString str = ui->lineEdit->text();
    m_pMessage->setAuthor(str);

}
