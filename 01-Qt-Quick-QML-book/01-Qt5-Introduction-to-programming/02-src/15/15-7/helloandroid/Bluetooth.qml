import QtQuick 2.12
import QtBluetooth 5.12
import QtQuick.Controls 2.12

Item {
    id: top
    BluetoothDiscoveryModel {
        id: btModel
        discoveryMode: BluetoothDiscoveryModel.DeviceDiscovery
    }

    ListView {
        id: mainList
        width: top.width
        anchors.top: busy.bottom
        anchors.bottom: button.top
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        clip: true
        spacing: 20

        model: btModel

        delegate: Rectangle {
            id: btDelegate
            width: parent.width
            height: column.height + 10

            property bool expended: false;
            clip: true
            Image {
                id: bticon
                source: "qrc:/images/bluetooth.png";
                width: bttext.height;
                height: bttext.height;
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 5
            }

            Column {
                id: column
                anchors.left: bticon.right
                anchors.leftMargin: 5
                Text {
                    id: bttext
                    text: deviceName ? deviceName : name
                }

                Text {
                    id: details
                    function get_details(s) {
                        var str = "Address: " + remoteAddress;
                        return str;
                    }
                    visible: opacity !== 0
                    opacity: btDelegate.expended ? 1 : 0.0
                    text: get_details(service)
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: btDelegate.expended = !btDelegate.expended
            }
        }
        focus: true
    }

    Rectangle {
        id: busy

        width: top.width * 0.7;
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: top.top;
        height: text.height*1.2;
        radius: 5
        color: "#1c56f3"
        visible: btModel.running

        Text {
            id: text
            text: qsTr("扫描中...")
            anchors.centerIn: parent
        }

        SequentialAnimation on color {
            ColorAnimation { easing.type: Easing.InOutSine;
                from: "#1c56f3"; to: "white"; duration: 1000; }
            ColorAnimation { easing.type: Easing.InOutSine;
                to: "#1c56f3"; from: "white"; duration: 1000 }
            loops: Animation.Infinite
        }
    }

    Button {
        id:button
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: qsTr("检测")
        onClicked: {
            btModel.running = true
        }
    }
}
