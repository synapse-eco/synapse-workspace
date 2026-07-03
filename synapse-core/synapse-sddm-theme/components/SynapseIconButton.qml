import QtQuick 2.15
import QtQuick.Controls 2.15

ToolButton {
    id: iconBtn
    background: Rectangle { anchors.fill: parent; color: "transparent" }
    contentItem: Image { source: icon.source; fillMode: Image.PreserveAspectFit; anchors.centerIn: parent; width: 20; height: 20 }
}
