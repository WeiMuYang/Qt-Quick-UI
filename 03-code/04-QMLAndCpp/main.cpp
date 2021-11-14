#include "mainwindow.h"
#include <QApplication>
#include "qmlwidget.h"


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
//    MainWindow w;
//    w.show();
    QmlWidget qmlwgt;


    return a.exec();
}
