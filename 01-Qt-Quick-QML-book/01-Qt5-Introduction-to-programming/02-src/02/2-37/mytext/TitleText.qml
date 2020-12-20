import QtQuick 2.9

Text {
    property int size
    text: "<b>" + title + "</b>"
    font.pixelSize: size
}

