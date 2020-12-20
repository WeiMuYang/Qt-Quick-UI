import QtQuick 2.9
import QtQuick.Window 2.2
import QtCharts 2.3

Window {
    visible: true
    width: 640
    height: 480

    ChartView {
        title: "Line"
        anchors.fill: parent
        antialiasing: true

        LineSeries {
            name: "LineSeries"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.1; y: 2.1 }
            XYPoint { x: 1.9; y: 3.3 }
        }
    }
}
