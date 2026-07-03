import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2

import org.kde.plasma.components as PlasmaComponents3
import org.kde.plasma.extras as PlasmaExtras
import org.kde.kirigami as Kirigami
import "components" as Components

SessionManagementScreen {
    id: root
    property Item mainPasswordBox: loginCard

    property bool showUsernamePrompt: !showUserList

    property string lastUserName
    property bool loginScreenUiVisible: false

    //the y position that should be ensured visible when the on screen keyboard is visible
    property int visibleBoundary: mapFromItem(loginCard, 0, 0).y
    onHeightChanged: visibleBoundary = mapFromItem(loginCard, 0, 0).y + loginCard.height + Kirigami.Units.smallSpacing

    property real fontSize: Kirigami.Theme.defaultFont.pointSize

    signal loginRequest(string username, string password)

    onShowUsernamePromptChanged: {
        if (!showUsernamePrompt) {
            lastUserName = ""
        }
    }

    onUserSelected: {
        // Don't startLogin() here, because the signal is connected to the
        // Escape key as well, for which it wouldn't make sense to trigger
        // login.
        loginCard.clearPassword()
        loginCard.focusFirstField();
    }

    QQC2.StackView.onActivating: {
        // Controls are not visible yet.
        Qt.callLater(function() { loginCard.focusFirstField() })
    }

    /*
     * Login has been requested with the following username and password
     * If username field is visible, it will be taken from that, otherwise from the "name" property of the currentIndex
     */
    function startLogin() {
        const username = showUsernamePrompt ? loginCard.username : userList.selectedUser
        const password = loginCard.password

        footer.enabled = false
        mainStack.enabled = false
        userListComponent.userList.opacity = 0.75

        // This is partly because it looks nicer, but more importantly it
        // works round a Qt bug that can trigger if the app is closed with a
        // TextField focused.
        //
        // See https://bugreports.qt.io/browse/QTBUG-55460
        loginCard.focusSignIn();
        loginRequest(username, password);
    }

    // Central polished login card
    Components.LoginCard {
        id: loginCard
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        onLoginRequested: function(username, password) {
            // reuse the existing login flow
            footer.enabled = false
            mainStack.enabled = false
            userListComponent.userList.opacity = 0.75
            loginRequest(username, password)
        }
    }
}
