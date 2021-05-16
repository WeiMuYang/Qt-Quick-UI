import QtQuick 2.9
import QtQuick.Window 2.2
import HelloWorld 1.0

Window {

    visible: true
    width: 1000
    height: 800
    title: qsTr("Hello World")
    color: "white"

    FPSLabel {
        width: 150
        height: 50
    }

    Loader {
            id: pageLoader
            source: "qrc:/CloudHole.qml"
        }


    Item {
        id:item1
        y:100
        width: 1000
        height: 800

//        Loader {
//                id: pageLoader
//                source: "qrc:/CloudHole.qml"
//            }


    }
}
