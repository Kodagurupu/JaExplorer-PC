import QtQuick 2.9

Item
{
    id: options
    anchors.fill: parent
    Text
    {
        id: version
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        anchors.right: parent.right
        anchors.rightMargin: 5
        font.bold: true
        font.italic: true
        font.pixelSize: 10
        text: qsTr("Version: a_003")
        color: "white"
    }
    Image
    {
        id: logo
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 12
        fillMode: Image.Stretch
        source: "../Images/programLogo.png"
        sourceSize: Qt.size(128,128)
    }

    Text
    {
        id: title
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 132
        font.bold: true
        font.italic: true
        font.pixelSize: 15
        text: qsTr("JaExplorer Options")
        color: "white"
    }
}
