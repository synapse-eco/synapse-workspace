/*
 * Synapse OS Genesis SDDM Theme
 * Background.qml
 */

import QtQuick

Rectangle {
    id: root

    anchors.fill: parent
    color: "#000000"

    // ------------------------------------------------------------
    // Background Wallpaper
    // ------------------------------------------------------------

    Image {
        id: wallpaper

        anchors.fill: parent

        source: config.background

        fillMode: Image.PreserveAspectCrop
        smooth: true
        mipmap: true
        asynchronous: true
        cache: true

        opacity: 0.0

        Behavior on opacity {
            NumberAnimation {
                duration: 600
                easing.type: Easing.OutCubic
            }
        }

        Component.onCompleted: opacity = 1.0
    }

    // ------------------------------------------------------------
    // Dark cinematic overlay
    // ------------------------------------------------------------

    Rectangle {
        anchors.fill: parent
        color: "#660B0F14"   // ~40% opacity
    }

    // ------------------------------------------------------------
    // Soft vignette
    // ------------------------------------------------------------

    RadialGradient {
        anchors.fill: parent

        horizontalRadius: width * 0.8
        verticalRadius: height * 0.8

        gradient: Gradient {
            GradientStop {
                position: 0.55
                color: "#00000000"
            }

            GradientStop {
                position: 1.0
                color: "#66000000"
            }
        }
    }

    // ------------------------------------------------------------
    // Subtle animated gradient overlay (adds glassy premium feel)
    // ------------------------------------------------------------
    Rectangle {
        anchors.fill: parent
        color: "transparent"
        opacity: 0.45

        property real offset: 0

        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0.02,0.15,0.30, 0.65) }
            GradientStop { position: 0.5; color: Qt.rgba(0.02,0.22,0.40, 0.25) }
            GradientStop { position: 1.0; color: Qt.rgba(0.01,0.06,0.18, 0.55) }
        }

        SequentialAnimation on offset {
            loops: Animation.Infinite
            NumberAnimation { to: 1; duration: 18000; easing.type: Easing.InOutQuad }
            NumberAnimation { to: 0; duration: 18000; easing.type: Easing.InOutQuad }
        }
    }

        // performance toggle
        property bool enableParticles: true
    // ------------------------------------------------------------
    // Soft floating particles for depth
    // ------------------------------------------------------------
    Item {
        anchors.fill: parent
        opacity: 0.9

        Repeater {
                model: root.enableParticles ? 18 : 0
            Rectangle {
                width: 4 + Math.round(Math.random() * 6)
                height: width
                radius: width/2
                color: "#5FC3FF"
                x: Math.random() * parent.width
                y: Math.random() * parent.height
                opacity: 0

                Behavior on x { NumberAnimation { duration: 12000; easing.type: Easing.InOutSine } }
                Behavior on y { NumberAnimation { duration: 12000; easing.type: Easing.InOutSine } }
                Behavior on opacity { NumberAnimation { duration: 1200 } }

                Component.onCompleted: {
                    SequentialAnimation {
                        loops: Animation.Infinite
                        PauseAnimation { duration: Math.random() * 8000 }
                        ParallelAnimation {
                            NumberAnimation { target: parent; property: "x"; to: Math.random() * parent.width; duration: 12000 + Math.random()*8000 }
                            NumberAnimation { target: parent; property: "y"; to: Math.random() * parent.height; duration: 12000 + Math.random()*8000 }
                            NumberAnimation { target: this; property: "opacity"; from: 0; to: 0.9; duration: 1200 }
                        }
                        NumberAnimation { target: this; property: "opacity"; to: 0; duration: 1800 }
                    }.start()
                }
            }
        }
    }

    // ------------------------------------------------------------
    // Subtle branded glow that slowly rotates and drifts
    // ------------------------------------------------------------
    Image {
        anchors.centerIn: parent
        source: "assets/logo/synapse-logo.svg"
        opacity: 0.06
        width: parent.width * 0.6
        height: width
        fillMode: Image.PreserveAspectFit
        smooth: true
        RotationAnimator on rotation { from: -5; to: 5; duration: 24000; loops: Animation.Infinite; easing.type: Easing.InOutSine }
        NumberAnimation on x { to: x+6; duration: 16000; loops: Animation.Infinite; easing.type: Easing.InOutSine }
        NumberAnimation on y { to: y-6; duration: 18000; loops: Animation.Infinite; easing.type: Easing.InOutSine }
    }
}
