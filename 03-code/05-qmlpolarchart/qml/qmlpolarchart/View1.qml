import QtQuick 2.9      // 版本注意不能写成 2.0
import QtCharts 2.3     // 版本注意不能写成 2.0

Item {
    anchors.fill: parent
    //![1]
    PolarChartView {
        // title: "Two Series, Common Axes"
        anchors.fill: parent
        legend.visible: false
        antialiasing: true

        CategoryAxis{
            id: axisAngular
            min: 0
            max: 360
//            tickCount: 5
            labelsPosition: CategoryAxis.AxisLabelsPositionOnValue

            CategoryRange {
                label: "北"
                endValue: 0
            }
            CategoryRange {
                label: "东"
                endValue: 90
            }
            CategoryRange {
                label: "南"
                endValue: 180
            }
            CategoryRange {
                label: "西"
                endValue: 270
            }
        }
        ValueAxis {
            id: axisRadial
            min: 0
            max: 10
        }

        ScatterSeries {
            id: series2
            axisAngular: axisAngular
            axisRadial: axisRadial
            markerShape: ScatterSeries.MarkerShapeRectangle
           //  borderColor: "#ff0000"
            // borderWidth: 3
            markerSize: 15
        }

        ScatterSeries {
            id: series1
            axisAngular: axisAngular
            axisRadial: axisRadial
            markerShape: ScatterSeries.MarkerShapeCircle
           //  borderColor: "#00ff00"
            markerSize: 15
        }
    }

    // Add data dynamically to the series
    Component.onCompleted: {
        series2.append(0, 4.5);
        series2.append(90, Math.random());
        series1.append(180, 8);
        series1.append(270, 5.7);
    }
    //![1]
}
