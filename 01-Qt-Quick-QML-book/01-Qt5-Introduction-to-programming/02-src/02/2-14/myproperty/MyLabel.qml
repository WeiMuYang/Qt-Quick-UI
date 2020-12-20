import QtQuick 2.9

Text {
    default property var someText
    text: "Hello, " + someText.text
}
