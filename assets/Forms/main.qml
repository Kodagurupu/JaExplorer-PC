import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

Window
{
    width: 720
    height: 480
    visible: true
    title: qsTr("Hello World")

    flags: Qt.Window | Qt.WA_TranslucentBackground

    color: "black"
    opacity: 0.9

    LeftPanel
    {
        id: leftPanel
        switchFunc: switchFunc
    }

    Timer
    {
        id: switchFunc
        interval: 0
        repeat: false
        property string fileName: "WelcomePage.qml"

        onTriggered:
        {
            loader.source = fileName
        }
    }

    Loader
    {
        id: loader
        width: parent.width - leftPanel.width
        height: parent.height
        anchors.right: parent.right
        source: "WelcomePage.qml"
    }
}
