import QtQuick 2.9
import QtQuick.Window 2.2
import DisPlayFPS 1.0

Window {
    visible: true
    width: 800
    height: 640
    title: qsTr("Hello World")
    color: "white"

    FPSLabel {
        width: 100
        height: 50
    }

    Item {
        width: 1000
        height: 800

        Rectangle {
            y: 100
            width: 1000
            height: 800

            Image {
                width: 800
                height: 600
                source: "qrc:/img/pic.jpg"
            }

            SequentialAnimation on x {
                id: xAnim
                // Animations on properties start running by default
                running: true
                loops: Animation.Infinite // The animation is set to loop indefinitely
                NumberAnimation { from: 0; to: 800; duration: 700; easing.type: Easing.InOutQuad }
                NumberAnimation { from: 800; to: 0; duration: 700; easing.type: Easing.InOutQuad }
                PauseAnimation { duration: 250 } // This puts a bit of time between the loop
            }
        }
    }




}
