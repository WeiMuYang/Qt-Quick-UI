import QtQuick 2.9
import QtQuick.Window 2.2
import DisplayFps 1.0

Window {
    id: windowId
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    title: qsTr("图片放缩测试")
    color: "white"

    FPSLabel {
        width: 150
        height: 50
        Item {
            id:item1
            y:150
    //        width: windowId.width
    //        height: windowId.height

            Rectangle {
                //color: "blue"
                id: mapItemArea

                width: mapItemArea.width
                height: mapItemArea.width * 0.7
                x: windowId.width/2 - mapItemArea.width / 2
                y: windowId.height/2 - mapItemArea.height / 2
                Image {
                    id: mapImg
                    //这里使图片居中显示
                    width: mapItemArea.width
                    height: mapItemArea.height
                    source: "qrc:/img/pic.jpg"
                    x: mapItemArea.width / 2-mapImg.width / 2
                    y: mapItemArea.height / 2-mapImg.height / 2 - 150
                    asynchronous: true

                }

                // By setting this SequentialAnimation on x, it and animations within it will automatically animate
                // the x property of this element
                SequentialAnimation{
                    id: size
                    running: true
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: mapItemArea
                        property: "width"
                        duration: 2000
                        easing.type: Easing.InOutQuad
                        from:0
                        to:windowId.width - 400
                    }

                    NumberAnimation {
                        target: mapItemArea
                        property: "width"
                        duration: 2000
                        easing.type: Easing.InOutQuad
                        from:windowId.width - 400
                        to:0
                    }

                }// SequentialAnimation 结束

    //            ParallelAnimation {
    //                //数值动画
    //                id: xcgo
    //                running: true
    //                loops: Animation.Infinite
    //                PropertyAnimation  {
    //                    target: mapItemArea
    //                    properties: "opacity"
    //                    to: 0.0
    //                    duration: 1000
    //                }
    //            }  // end ParallelAnimation

            }
        }
    }


}
