import QtQuick 2.15

Rectangle {
    id: note
    width: parent ? parent.width : 600
    height: implicitHeight
    color: "rgba(10,14,18,0.8)"
    radius: 8
    anchors.top: parent ? parent.top : undefined
    anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined
    visible: false

    Text { id: txt; anchors.fill: parent; anchors.margins: 12; color: "#FFFFFF" }

    function show(message) {
        txt.text = message
        visible = true
        Timer { interval: 3000; running: true; repeat: false; onTriggered: note.visible = false }
    }
}
