import QtQuick 2.4

MainForm {
    button.onClicked: {
        button.text = qsTr("hello Qt Quick!")
    }
}
