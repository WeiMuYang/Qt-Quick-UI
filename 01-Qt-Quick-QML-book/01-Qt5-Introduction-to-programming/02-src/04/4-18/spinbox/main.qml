import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 250; height: 200

    Column {
        spacing: 20
        anchors.centerIn: parent

        SpinBox {
            value: 50
        }

        SpinBox {
            id: levelBox
            from: 0; to: items.length - 1; value: 1 // "Medium"
            editable: true

            property var items: ["Small", "Medium", "Large"]

            validator: RegExpValidator {
                regExp: new RegExp("(Small|Medium|Large)", "i")
            }

            textFromValue: function(value) {
                return items[value];
            }

            valueFromText: function(text) {
                for (var i = 0; i < items.length; ++i) {
                    if (items[i].toLowerCase().indexOf(text.toLowerCase()) === 0)
                        return i
                }
                return levelBox.value
            }
        }

        SpinBox {
            id: doubleBox
            from: 0; to: 100 * 100; stepSize: 100; value: 110

            property int decimals: 2
            property real realValue: value / 100

            validator: DoubleValidator {
                bottom: Math.min(doubleBox.from, doubleBox.to)
                top:  Math.max(doubleBox.from, doubleBox.to)
            }

            textFromValue: function(value, locale) {
                return Number(value / 100).toLocaleString(locale, 'f', doubleBox.decimals)
            }

            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * 100
            }
        }
    }
}
