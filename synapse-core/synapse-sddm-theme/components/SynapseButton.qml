import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: root
    implicitWidth: 160
    implicitHeight: 44
    radius: 10
    font.bold: true
    background: Rectangle {
        anchors.fill: parent
        color: root.enabled ? "#0B0F14" : "#091018"
        border.color: "rgba(255,255,255,0.06)"
        radius: 10
        layer.enabled: true
    }
    transform: Scale { id: hoverScale; xScale: 1; yScale: 1 }
    focusPolicy: Qt.StrongFocus

    states: State {
        name: "focused"
        when: root.activeFocus
        PropertyChanges { target: hoverScale; xScale: 1.02; yScale: 1.02 }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: { hoverScale.xScale = 1.02; hoverScale.yScale = 1.02 }
        onExited: { if (!root.activeFocus) { hoverScale.xScale = 1; hoverScale.yScale = 1 } }
    }

    Rectangle {
        id: focusRing
        anchors.fill: parent
        color: "transparent"
        border.color: root.activeFocus ? "#00D1FF" : "transparent"
        border.width: 2
        radius: 10
        Behavior on border.color { ColorAnimation { duration: 160 } }
        z: 2
    }
}
