import QtQuick 2.9

Item {
    property string title

    TitleText {
        size: 22
        anchors.top: parent.top
    }

    TitleText {
        size: 18
        anchors.bottom: parent.bottom
    }
}
