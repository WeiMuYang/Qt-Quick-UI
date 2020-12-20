import QtQuick 2.12

Item {
    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
    }

    MultiPointTouchArea {
        anchors.fill: parent
        touchPoints: [
            TouchPoint { id: point1 },
            TouchPoint { id: point2 }
        ]
        onPressed: {
            if(point1.pressed && point2.pressed)
                background.color = "red"
            else background.color = "white"
        }
    }

    Rectangle {
        width: 30; height: 30
        color: "green"
        x: point1.x
        y: point1.y
    }

    Rectangle {
        width: 30; height: 30
        color: "yellow"
        x: point2.x
        y: point2.y
    }
}
