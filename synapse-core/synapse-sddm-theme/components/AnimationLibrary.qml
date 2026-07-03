import QtQuick 2.15

QtObject {
    // Easing presets
    readonly property var easeOutCubic: Easing.OutCubic
    readonly property var easeOutQuart: Easing.OutQuart
    readonly property var easeInOutCubic: Easing.InOutCubic

    // Convenience durations (ms)
    property int shortDuration: 150
    property int baseDuration: 200
    property int longDuration: 220
}
