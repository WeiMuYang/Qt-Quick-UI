import QtQuick 2.9
import QtGraphicalEffects 1.12

Item {
    width: 300; height: 300

    Image {
        id: bug; source: "images/bug.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    RadialBlur {
        anchors.fill: bug; source: bug
        samples: 24; angle: 30
    }
}


