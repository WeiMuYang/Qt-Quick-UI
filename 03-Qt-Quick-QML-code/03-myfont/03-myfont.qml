import QtQuick 2.9
Text {
    onFontChanged:console.log("font changed")
    text:"hello Qt!"
    Text{
        id:otherText
    }
    focus: true
    // 下面操作会，调用onChanged信号处理器
    Keys.onDigit1Pressed:font.pixelSize += 1
    Keys.onDigit2Pressed:font = !font.italic
    Keys.onDigit3Pressed:font = otherText.font
}
