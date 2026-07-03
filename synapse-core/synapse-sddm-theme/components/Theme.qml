import QtQuick 2.15

QtObject {
    // Color tokens
    property color deepSpaceBlue: "#051428"
    property color accent: "#00D1FF"
    property color highlight: "#7EEBFF"
    property color glass: "#0B0F14"
    property color text: "#FFFFFF"
    property color secondary: "#A8B0BA"
    property color success: "#6EE7B7"
    property color danger: "#FF6B6B"

    // Layout tokens
    property int radius: 16
    property int spacing: 16
    property int gutter: 24

    // Motion tokens (ms)
    property int motionShort: 150
    property int motionBase: 200
    property int motionLong: 220

    // Typography
    property string fontFamily: "Noto Sans"
    property int fontSize: 12
}
