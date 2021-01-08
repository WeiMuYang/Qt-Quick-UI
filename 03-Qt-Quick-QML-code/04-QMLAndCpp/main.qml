import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
Rectangle {
    id : root;
    width: 300
    height: 300
    color: "yellow"
    signal qmlClicked()
    signal widgetClicked()
    onWidgetClicked: {
        console.log("widget sig to qml slot")
    }
    Button {
        id : qmlBtn
        anchors.top: parent.top
        text : "qml btn"
        onClicked: {
            console.log("qml btn clicked")
        }
    }
    Button {
        anchors.left: qmlBtn.right
        anchors.leftMargin: 8
        text : "connect btn"
        onClicked: {
            qmlClicked()
        }
    }
}
