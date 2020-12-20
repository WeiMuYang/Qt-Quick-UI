import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window; width: 320; height: 260; visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            Action { text: qsTr("New...") }
            Action { text: qsTr("Open...") }
            Action { text: qsTr("Save") }
            Action { text: qsTr("Save As...") }
            MenuSeparator { }
            Action { text: qsTr("Quit") }
        }
        Menu {
            title: qsTr("Edit")
            Action { text: qsTr("Cut") }
            Action { text: qsTr("Copy") }
            Action { text: qsTr("Paste") }
        }
        Menu {
            title: qsTr("Help")
            Action { text: qsTr("About") }
        }

        delegate: MenuBarItem {
            id: menuBarItem

            contentItem: Text {
                text: menuBarItem.text
                font: menuBarItem.font
                opacity: enabled ? 1.0 : 0.3
                color: menuBarItem.highlighted ? "#ffffff" : "#21be2b"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: menuBarItem.highlighted ? "#21be2b" : "transparent"
            }
        }

        background: Rectangle {
            implicitWidth: 40
            implicitHeight: 40
            color: "#ffffff"

            Rectangle {
                color: "#21be2b"
                width: parent.width
                height: 1
                anchors.bottom: parent.bottom
            }
        }
    }
}
