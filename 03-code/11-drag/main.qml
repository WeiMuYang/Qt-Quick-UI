import QtQuick 2.9
import QtQuick.Window 2.3   // 为了使用Window

Window {
    visible: true
    width: 640
    height: 480

    Rectangle {
        id: mixBox
        width: 50
        height: 50

        SequentialAnimation{ // 循环动画里面可以嵌套 并行特效
            NumberAnimation { target: para; }

            running: true
            loops: Animation.Infinite // 设置动画无限期循环

        }
        ParallelAnimation {       // 并行执行下面的操作
            id: para
            ColorAnimation {      // 1 颜色变化
                target: mixBox
                property: "color"
                from: "forestgreen"
                to: "lightsteelblue";
                duration: 3000
            }
            ScaleAnimator {       // 2 比例变化
                target: mixBox
                from: 5
                to: 10
                duration: 8000
            }
            running: true
        }
    }
}
