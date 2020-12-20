import QtQuick 2.9

Item {
    width: 800; height: 800

    Ball { id: ball }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            ball.color = Qt.tint(ball.color, "#10FF0000")
            ball.x += 100
            ball.y += 100
        }
    }
}

