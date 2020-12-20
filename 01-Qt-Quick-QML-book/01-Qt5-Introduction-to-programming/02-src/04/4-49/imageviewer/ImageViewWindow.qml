import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3 as StandardDialogs

ApplicationWindow {
    visible: true
    title: qsTr("Image Viewer")

    function openFileDialog() { fileOpenDialog.open(); }
    function openAboutDialog() { aboutDialog.open(); }

    background: Rectangle {
        color: "darkGray"
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    StandardDialogs.FileDialog {
        id: fileOpenDialog
        title: "Select an image file"
        folder: shortcuts.documents
        nameFilters: [
            "Image files (*.png *.jpeg *.jpg)",
        ]
        onAccepted: {
            image.source = fileOpenDialog.fileUrl
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("About")
        modal: true
        anchors.centerIn: parent
        Label {
            anchors.fill: parent
            text: qsTr("Image Viewer\nBased on QML")
            horizontalAlignment: Text.AlignHCenter
        }

        standardButtons: Dialog.Ok
    }
}
