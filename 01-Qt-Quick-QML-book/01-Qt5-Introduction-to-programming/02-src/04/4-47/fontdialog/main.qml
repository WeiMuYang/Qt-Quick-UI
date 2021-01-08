import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

ApplicationWindow {
    visible: true
    id: window; width: 300; height: 300
    Label {
        id: fontLabel
        anchors.top: parent.top;
        anchors.horizontalCenter: parent.horizontalCenter;
        text: "Hello, world!"
    }

    Button {
        width: 100; height: 50; text: "Font Dialog"
        anchors.centerIn: parent
        onClicked: fontDialog.open()
    }

    FontDialog {
        id: fontDialog
        title: "Please choose a font"
        font: Qt.font({ family: "Arial", pointSize: 24,
                        weight: Font.Normal })
        onAccepted: { fontLabel.font = fontDialog.font }
        onRejected: { console.log("Canceled") }
    }
}