import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import org.kde.plasma.extras as PlasmaExtras

GlassPanel {
    id: card
    width: Math.min(parent ? parent.width * 0.46 : 520, 520)
    height: 380

    property alias username: userField.text
    property alias password: passField.text

    signal loginRequested(string username, string password)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 12

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 12
            UserAvatar { width: 72; height: 72 }
            ColumnLayout {
                spacing: 2
                SynapseLabel { text: qsTr("Synapse OS"); font.pointSize: 16 }
                SynapseLabel { text: qsTr("Genesis"); font.pointSize: 12; color: "#A8B0BA" }
            }
        }

        Rectangle { height: 1; color: "transparent" }

        SynapseTextField {
            id: userField
            placeholderText: qsTr("Username")
            Layout.fillWidth: true
        }

        PlasmaExtras.PasswordField {
            id: passField
            placeholderText: qsTr("Password")
            Layout.fillWidth: true
            rightActions: []
            onAccepted: submit()
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            SynapseButton {
                id: signIn
                text: qsTr("Sign In")
                Layout.preferredWidth: 140
                onClicked: submit()
            }

            Item { Layout.fillWidth: true }

            SynapseIconButton {
                id: sessionBtn
                width: 40; height: 40
                // session list is provided by parent Main.qml via signals
            }

            SynapseIconButton {
                id: kbBtn
                width: 40; height: 40
            }
        }

        Item { Layout.fillHeight: true }

        RowLayout {
            Layout.alignment: Qt.AlignLeft
            spacing: 8
            SynapseLabel { text: qsTr("Need help?"); color: "#A8B0BA" }
            LoadingIndicator { visible: false }
        }
    }

    function submit() {
        loginRequested(userField.text, passField.text)
    }

    function focusFirstField() {
        if (userField && userField.visible) {
            userField.forceActiveFocus()
        } else if (passField && passField.visible) {
            passField.forceActiveFocus()
        } else if (signIn) {
            signIn.forceActiveFocus()
        }
    }

    function clearPassword() {
        if (passField) passField.clear()
    }

    function focusSignIn() {
        if (signIn) signIn.forceActiveFocus()
    }
}
