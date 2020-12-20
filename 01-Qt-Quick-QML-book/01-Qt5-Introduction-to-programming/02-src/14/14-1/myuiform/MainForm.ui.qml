import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: element
    width: 400
    height: 400
    property alias button: button

    Button {
        id: button
        x: 158
        y: 190
        text: qsTr("Button")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
