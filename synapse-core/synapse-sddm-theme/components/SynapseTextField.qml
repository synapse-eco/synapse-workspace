import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: field
    placeholderText: ""
    font.pointSize: 13
    implicitHeight: 44
    Rectangle {
        id: box
        anchors.fill: parent
        color: "transparent"
    }

    Rectangle {
        id: underline
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 2
        color: activeFocus ? "#00D1FF" : "transparent"
        Behavior on color { ColorAnimation { duration: 180; easing.type: Easing.InOutCubic } }
    }

    focusPolicy: Qt.StrongFocus
    onActiveFocusChanged: {
        // Slight hint scaling or animations could go here
    }

    Behavior on opacity { NumberAnimation { duration: 180 } }
}
