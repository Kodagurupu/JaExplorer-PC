import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item
{
    anchors.fill: parent

    Rectangle
    {
        id: databaseError
        anchors.fill: parent
        clip: true
        color: "black"

        Text
        {
            id: errorName
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 72
            font.bold: true
            font.italic: true
            font.pixelSize: 32
            text: qsTr("Database Error!")
            color: "#e62323"
        }

        Text
        {
            id: errorDesctiption
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.centerIn: parent
            font.bold: true
            font.italic: true
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            text: qsTr("Database file not found or corrupted.\n\nPlease reinstall the program.")
            color: "gray"
        }

        Button
        {
            id: reinstallProgram
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 72
            Material.foreground: "#e72e2e"
            font.bold: true
            font.pixelSize: 24
            text: qsTr("Reinstall")
            // To change the shape of the cursor
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Qt.openUrlExternally("https://github.com/Kodagurupu/JaExplorer-PC#installation-guide-linux")
            }
        }

        Button
        {
            id: goBackFromError
            anchors.right: parent.right
            anchors.rightMargin: 16
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            Material.foreground: Material.Grey
            text: "Exit"
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: tabLoader.source = "WelcomePage.qml"
            }
        }
    }
}
