import QtQuick 2.9

Rectangle {
    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    width: 300; height: 60
    color: "lightyellow"
    border.width: 1

    Row {
        anchors { left: parent.left; margins: 5 }
        y: 5; spacing: 5; padding: 5

        Repeater {
            model: 5

            Rectangle {
                color: "grey"
                opacity: (5 - index) / 5
                width: 40; height: 40

                Text {
                    text: index + 1
                    anchors.centerIn: parent
                    font.bold: true
                }
            }
        }
    }
}
