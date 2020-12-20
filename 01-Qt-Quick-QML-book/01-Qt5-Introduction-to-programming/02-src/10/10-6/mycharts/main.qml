import QtQuick 2.9
import QtQuick.Window 2.2
import QtCharts 2.3
import QtGraphicalEffects 1.12

Window {
    visible: true
    width: 640
    height: 480
    color: "black"

    ChartView {
        id: chartView
        title: qsTr("我的图表")
        //        titleColor: Qt.lighter("blue")
        //        titleFont{ bold: true; pointSize: 20}
        //        plotAreaColor: "lightgrey"
        //        backgroundColor: Qt.lighter("red")
        //        backgroundRoundness: 25
        //        dropShadowEnabled: true

        anchors.fill: parent
        anchors.margins: 20
        antialiasing: true

     //   theme: ChartView.ChartThemeBrownSand

        backgroundColor: "transparent"

        animationOptions: ChartView.AllAnimations
        animationDuration: 5000

        LineSeries {
            name: "LineSeries"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.1; y: 2.1 }
            XYPoint { x: 1.9; y: 3.3 }
        }
    }

    Glow {
        id:glow
        anchors.fill: chartView
        radius: 13
        samples: 37
        color: "white"
        source: chartView
    }
}


