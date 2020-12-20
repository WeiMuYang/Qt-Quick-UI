import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window; width: 400; height: 100; visible: true

    Button {
        text: qsTr("Button"); hoverEnabled: true
        ToolTip.delay: 1000; ToolTip.timeout: 5000; ToolTip.visible: hovered
        ToolTip.text: "This tool tip is shown <font color='red'>after</font> <strong>hovering</strong> the button for a second."
    }
}
