import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

ApplicationWindow {
    visible: true
    id: window; width: 300; height: 300
    Button {
        width: 100; height: 50; text: "Color Dialog"
        anchors.centerIn: parent
        onClicked: colorDialog.open()
    }

    ColorDialog {
        id: colorDialog
        title: "Please choose a color"
        onAccepted: { window.color = color }
        onRejected: { console.log("Canceled")}
    }
}
