import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Flickable {
        width: 200;
        contentWidth: image.width
        contentHeight: image.height

        Image {
            id: image
            source: "qrc:/img/picture.jpeg"
        }

    }
}
