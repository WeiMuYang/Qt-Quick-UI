import QtQuick 2.9
import QtGraphicalEffects 1.12

Item {
    width: 300; height: 300

    Image {
        id: butterfly; source: "images/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    InnerShadow {
        anchors.fill: butterfly; source: butterfly
        color: "#b0000000"; radius: 8.0; samples: 16
        horizontalOffset: -4; verticalOffset: 4
    }
}
