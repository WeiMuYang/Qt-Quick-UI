import QtQuick 2.9

//Column {
//    FontLoader {
//        id: fixedFont;
//        name: "Courier"
//    }
//    FontLoader {
//        id: webFont;
//        source: "http://qter-images.qter.org/other/myfont.ttf"
//    }
//    Text {
//        text: "Fixed-size font";
//        font.family: fixedFont.name
//    }
//    Text {
//        text: "Fancy font";
//        font.family: webFont.name
//    }
//}

Rectangle {
    width: 200; height: 200; color: "lightgrey"

    Text {
        width: 200; height: 200
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: qsTr("中心")
        font.pointSize: 20
    }
}




