import QtQuick 2.7
import QtQuick.Controls 2.0
import QtCharts 2.2

Item {
    id: root
    visible: true
    width: 400
    height: 300
   //  title: qsTr("Qml饼状图")

    ChartView {
        anchors.fill: parent
        theme: ChartView.ChartThemeQt
        antialiasing: true
        // legend.visible: false
        animationOptions: ChartView.AllAnimations

        PieSeries {
            id: pieSeries
            PieSlice {
                borderColor: "#AAAAAA"
                color: "#804040"
                label: qsTr("整形")
                labelVisible: true
                value: 66.6
            }
            PieSlice {
                borderColor: "#AAAAAA"
                color: "#408040"
                label: qsTr("字符串")
                labelVisible: true
                value: 30
            }
            PieSlice {
                borderColor: "#AAAAAA"
                color: "#404080"
                label: qsTr("文件")
                labelVisible: true
                value: 3.4
            }
        }
    }
}
