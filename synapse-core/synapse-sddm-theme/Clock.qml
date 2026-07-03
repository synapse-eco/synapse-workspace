import QtQuick 2.15

Item {
    id: clock
    width: 300
    height: 60

    Text {
        id: timeText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        text: Qt.formatTime(new Date(), "hh:mm")
        font.pointSize: 36
        color: "#FFFFFF"
    }

    Timer { interval: 1000; running: true; repeat: true; onTriggered: timeText.text = Qt.formatTime(new Date(), "hh:mm") }
}
