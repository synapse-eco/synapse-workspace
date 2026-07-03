import QtQuick 2.15

Item {
    width: 64; height: 16
    Row { spacing: 6; anchors.centerIn: parent
        Repeater { model: 3; Rectangle { width: 8; height: 8; radius: 4; color: "#00D1FF"; opacity: 0.4
            SequentialAnimation on opacity { loops: Animation.Infinite; NumberAnimation { to: 1; duration: 420 } NumberAnimation { to: 0.4; duration: 420 } }
        } }
}
