import QtQuick 2.9

Rectangle {
    id: rect

    function calculateHeight() { return rect.width / 2;}

    width: 100; height: calculateHeight()
}

