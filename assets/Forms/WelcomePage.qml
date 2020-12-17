import QtQuick 2.9

Item
{
    id: welcomePage
    anchors.fill: parent

    Image
    {
        id: background

        anchors.fill: parent
        fillMode: Image.Stretch
        source: "../Images/welcomePage.png"
        Image
        {
            id: logo
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 12
            fillMode: Image.Stretch
            source: "../Images/programLogo.png"
            sourceSize: Qt.size(parent.width - 128, parent.height - 128)
        }

        Text
        {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 32
            font.pixelSize: 64
            font.bold: true
            font.italic: true
            text: qsTr("JaExplorer")
            color: "white"
        }
    }
}
