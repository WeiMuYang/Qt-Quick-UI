import QtMultimedia 5.8
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.3

Item {
    id: rootItem

    Camera {
        id: camera
        imageCapture {
            onImageCaptured: {
                photoDialog.open()
                photoPreview.source = preview
            }
        }
        focus {
            focusMode: Camera.FocusAuto
            focusPointMode: Camera.FocusPointAuto
        }
    }

    VideoOutput {
        source: camera
        fillMode: VideoOutput.PreserveAspectCrop
        anchors.fill: parent
        autoOrientation: true
    }

    Popup {
        id: photoDialog
        visible: false
        width: parent.width
        height: parent.height
        contentItem: Image { id: photoPreview }
        MouseArea {
            anchors.fill: parent;
            onClicked: { photoDialog.close() }
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("拍照")
        onClicked: { camera.imageCapture.capture() }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("对焦")
        onClicked: {
            camera.searchAndLock()
        }
    }

    Button {
        text: qsTr("切换")
        onClicked: {
            if(camera.position == 1) {
                camera.position = Camera.FrontFace
            } else camera.position = Camera.BackFace
        }
    }
}
