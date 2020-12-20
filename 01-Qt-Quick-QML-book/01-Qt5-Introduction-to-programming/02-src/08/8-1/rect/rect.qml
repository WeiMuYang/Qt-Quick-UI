import QtQuick 2.12

Canvas {
    width: 200; height: 200

    onPaint: {
        var ctx = getContext("2d");
        ctx.fillStyle = "lightgrey" // 设置填充颜色为浅灰色
        ctx.strokeStyle = "blue" // 设置边线颜色为蓝色
        ctx.lineWidth = 4 // 设置边线宽度为4px
        ctx.lineJoin = "round"

        ctx.fillRect(20, 20, 160, 160)
        ctx.clearRect(30, 30, 140, 140)
        ctx.strokeRect(20, 20, 80, 80)
    }
}
