import QtQuick 2.9

Rectangle {
    width: 200
    height: 100
    TextInput{
        id: textInput
        focus: true
        onTextEdited: console.log(text)
    }
    MouseArea {
        anchors.fill: parent
        onClicked: textInput.text = "hello"
    }
}
