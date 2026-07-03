import QtQuick 2.15
import QtGraphicalEffects 1.0

Rectangle {
    id: panel
    width: 520
    height: 460
    radius: 14
    color: "rgba(10,14,18,0.48)"
    border.color: "rgba(255,255,255,0.04)"
    border.width: 1
    anchors.horizontalCenter: parent.horizontalCenter

    Behavior on opacity { NumberAnimation { duration: 200; easing.type: Easing.OutCubic } }

    // optional blur backdrop (will be a no-op on some renderers)
    ShaderEffectSource {
        id: source
        anchors.fill: parent
        sourceItem: parent
        hideSource: true
    }

    // fast blur behind the panel to create frosted glass
    FastBlur {
        anchors.fill: parent
        source: source
        radius: 10
        samples: 8
        opacity: 0.9
        visible: true
        z: -2
    }

    // subtle glass sheen
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: "rgba(255,255,255,0.04)"
        border.width: 1
        radius: panel.radius
        gradient: Gradient {
            GradientStop { position: 0.0; color: "rgba(255,255,255,0.03)" }
            GradientStop { position: 1.0; color: "rgba(255,255,255,0.00)" }
        }
        z: -1
    }

    // content loader for composition
    Loader {
        id: contentLoader
        anchors.fill: parent
    }
}
