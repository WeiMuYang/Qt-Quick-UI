import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 100
    height: 100
    title: qsTr("Hello World")

    ListView {
        anchors.fill: parent
        model: stringListModel
        delegate: Rectangle {
            height: 25; width: 100
            Text { text: modelData }
        }
    }
}
