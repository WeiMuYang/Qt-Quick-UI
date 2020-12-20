import QtQuick 2.12

Canvas {
  width:120; height: 120

  onPaint: {
    var ctx = getContext("2d")
    var conical = ctx.createConicalGradient(60, 60, Math.PI / 4)
    conical.addColorStop(0, "white")
    conical.addColorStop(0.5, "#FF00FF")
    conical.addColorStop(1, "#333333")
    ctx.fillStyle = conical
    ctx.fillRect(10, 10, 100, 100)
    ctx.strokeRect(10, 10, 100, 100)
  }
}
