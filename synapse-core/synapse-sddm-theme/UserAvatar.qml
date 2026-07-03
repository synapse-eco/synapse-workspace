import QtQuick 2.15

Item {
    width: 64; height: 64
    Image {
        id: avatar
        anchors.fill: parent
        source: "faces/.face.icon"
        fillMode: Image.PreserveAspectCrop
        smooth: true
        clip: true
        layer.enabled: true
    }
}
