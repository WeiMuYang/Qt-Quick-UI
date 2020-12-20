import QtQuick 2.9
import QtGraphicalEffects 1.12

Item {
    width: 300; height: 300

    Image {
        id: bug; source: "images/bug.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    Desaturate {
        anchors.fill: bug; source: bug; desaturation: 0.8
    }
}


