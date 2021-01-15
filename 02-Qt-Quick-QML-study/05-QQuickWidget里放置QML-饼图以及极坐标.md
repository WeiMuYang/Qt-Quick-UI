# QQuickWidget放置QML      



## 1 C++文档   

```c++
#include <QQmlContext>
#include <QQmlApplicationEngine>

StackWgtPages10::StackWgtPages10(Ui::MainWindow *pui, QObject *parent)
    : QObject(parent), m_pUi_mainWindow(pui)
{
    // 1. 对tableWgt1的初始化
    QQmlContext* pContext;
    m_qWgt_pingPic = m_pUi_mainWindow->page_10_qWgt_1;
    pContext = m_pUi_mainWindow->page_10_qWgt_1->engine()->rootContext();
    pContext->setContextProperty("w",m_pUi_mainWindow->page_10_qWgt_1->width());
    pContext->setContextProperty("h",m_pUi_mainWindow->page_10_qWgt_1->height());

    m_qWgt_barPic1 = m_pUi_mainWindow->page_10_qWgt_2;
    pContext = m_pUi_mainWindow->page_10_qWgt_2->engine()->rootContext();
    pContext->setContextProperty("w",m_pUi_mainWindow->page_10_qWgt_2->width());
    pContext->setContextProperty("h",m_pUi_mainWindow->page_10_qWgt_2->height());
    m_qWgt_barPic1->setSource(QUrl("qrc:/qml/bar_page10_1.qml"));

    m_qWgt_barPic2 = m_pUi_mainWindow->page_10_qWgt_3;
    pContext = m_pUi_mainWindow->page_10_qWgt_3->engine()->rootContext();
    pContext->setContextProperty("w",m_pUi_mainWindow->page_10_qWgt_3->width());
    pContext->setContextProperty("h",m_pUi_mainWindow->page_10_qWgt_3->height());
    m_qWgt_barPic2->setSource(QUrl("qrc:/qml/bar_page10_2.qml"));
}
```

## 2 QML文件     

```qml
import QtQuick 2.9      // 版本注意不能写成 2.0
import QtQuick.Controls 2.0
import QtCharts 2.3     // 版本注意不能写成 2.0
import QtQuick.Window 2.2  



Item {    // 此处是条目    
//    id: root
//    visible: true
    width: w
    height: h

    ChartView {
        anchors.fill: parent
        theme: ChartView.ChartThemeQt
        antialiasing: true
        // legend.visible: false
        legend.alignment:Qt.AlignRight
        animationOptions: ChartView.AllAnimations

        PieSeries {
            id: pieSeries
            holeSize: 0.25
            PieSlice {
                borderColor: "#AAAAAA"
                color: "#804040"
                label: qsTr("导 弹")
                labelVisible: true
                value: 17

            }
            PieSlice {
                borderColor: "#AAAAAA"
                color: "#408040"
                label: qsTr("战斗部")
                labelVisible: true
                value: 33
            }
            PieSlice {
                borderColor: "#AAAAAA"
                color: "#404080"
                label: qsTr("发射车")
                labelVisible: true
                value: 50
            }
        }
    }
}


```

## 3 遗留问题    
1. 如何修改图形的背景色    
2. 如何实现柱状图和折线图的叠加      
3. 如何实现QML的图框占满QQuickWidget      



## 参考资料   
1. https://www.cnblogs.com/judes/p/11359243.html      
2. https://shazhenyu.blog.csdn.net/article/details/70258498?utm_medium=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-2.nonecase&depth_1-utm_source=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-2.nonecase  