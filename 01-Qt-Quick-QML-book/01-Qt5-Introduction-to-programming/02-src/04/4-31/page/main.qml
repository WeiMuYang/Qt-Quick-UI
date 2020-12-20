import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true; width: 200; height: 200

    header: Label {
        text: view.currentItem.title
        horizontalAlignment: Text.AlignHCenter
    }

    SwipeView {
        id: view; anchors.fill: parent

        Page { title: qsTr("Home") }
        Page { title: qsTr("Discover") }
        Page { title: qsTr("Activity") }
    }
}
