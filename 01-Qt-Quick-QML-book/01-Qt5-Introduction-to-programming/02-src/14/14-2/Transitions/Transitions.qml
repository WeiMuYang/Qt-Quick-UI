import QtQuick 2.9
import QtQuick.Window 2.3

Rectangle {
    id: page
    visible: true
    width: 640
    height: 480
    color: "#343434"
 //   title: qsTr("Hello World")

    Image {
        id: icon
        x: 10
        y: 20
        width: 50
        fillMode: Image.PreserveAspectFit
        source: "qt-logo.png"
    }

    Rectangle {
        id: topLeftRect
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        border.color: "#808080"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }

    Connections {
        target: mouseArea
        onClicked: { page.state = "" }
    }

    Rectangle {
        id: middleRightRect
        x: 140
        y: 64
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
        }
        border.color: "#808080"
    }

    Rectangle {
        id: bottomLeftRect
        y: 64
        width: 64
        height: 64
        color: "#00000000"
        radius: 6
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        MouseArea {
            id: mouseArea2
            anchors.fill: parent
        }
        border.color: "#808080"
    }

    Connections {
        target: mouseArea1
        onClicked: { page.state = "State1" }
    }

    Connections {
        target: mouseArea2
        onClicked: { page.state = "State2" }
    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: icon
                x: middleRightRect.x
                y: middleRightRect.y
            }
        },
        State {
            name: "State2"

            PropertyChanges {
                target: icon
                x: bottomLeftRect.x
                y: bottomLeftRect.y
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"; to: "State1"
            NumberAnimation {
                easing.type: Easing.OutBounce
                properties: "x,y";
                duration: 1000
            }
        },

        Transition {
            from: "*"; to: "State2"
            NumberAnimation {
                properties: "x,y";
                easing.type: Easing.InOutQuad;
                duration: 2000
            }
        },

        Transition {
            NumberAnimation {
                properties: "x,y";
                duration: 200
            }
        }
    ]
}
