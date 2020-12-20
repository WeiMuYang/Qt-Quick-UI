import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

ApplicationWindow {
    visible: true
    id: window; width: 300; height: 300
    Label {
        id: filePathLabel
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right
    }

    Button {
        width: 100; height: 50; text: "File Dialog"
        anchors.centerIn: parent
        onClicked: fileDialog.open()
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        nameFilters: [ "Image files (*.jpg *.png)", "All files (*)" ]
        folder: shortcuts.music
        onAccepted: { filePathLabel.text = fileDialog.fileUrl }
        onRejected: { console.log("Canceled") }
    }
}
