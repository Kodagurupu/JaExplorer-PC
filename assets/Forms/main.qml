import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Window 2.3

Window
{
    id: root

    minimumWidth: 640
    minimumHeight: 480

    maximumWidth: 640
    maximumHeight: 480

    visible: true
    title: qsTr("JaExplorer")
    color: "black"
    opacity: 0.95

    flags: Qt.Window | Qt.CustomizeWindowHint

    property var pos: [ root.width / 2 - 320, root.height / 2 - 240 ]

    function programName(display)
    {
        if (display)
        {
            title.text = qsTr("JaExplorer")
        }
        else
        {
            title.text = qsTr("")
        }
    }

    Rectangle
    {
        id: titleBar
        width: parent.width
        height: 21
        color: "black"
        clip: true

        // gray line which separete title bar from pages
        Rectangle
        {
            id: line
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            color: "gray"
            width: parent.width
            height: 1
        }

        Text
        {
            id: title
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.italic: true
            color: "lightblue"
            text: qsTr("JaExplorer")
        }

        MouseArea
        {
            anchors.fill: parent
            property point lastMousePos: Qt.point(0, 0)
            onPressed:
            {
                lastMousePos = Qt.point(mouseX, mouseY)
            }
            onMouseXChanged: { root.x += (mouseX - lastMousePos.x); pos[0] = ( root.x ) }
            onMouseYChanged: { root.y += (mouseY - lastMousePos.y); pos[1] = ( root.y ) }
        }

        Row
        {
            id: upButtons
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            layoutDirection: Qt.LeftToRight
            width: titleBar.height * 2
            height: titleBar.height

            WindowControlButtons
            {
                image: "../Images/minimize.svg"
                onClicked: root.visibility = "Minimized"
            }
            WindowControlButtons
            {
                image: "../Images/close.svg"
                closed: true
                onClicked: root.close()
            }
        }
    }

    LeftPanel
    {
        id: leftPanel
        width: 42
        height: parent.height - titleBar.height
        switchFunc: tabSwitcher
        anchors.bottom: parent.bottom
        onEnableNameDisplay: programName(true)
        onDisableNameDisplay: programName(false)
    }

    Loader
    {
        id: loader
        width: parent.width - leftPanel.width
        height: parent.height - titleBar.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: "WelcomePage.qml"
        Component.onCompleted: programName(false) // Title turns off because the program name is inside the tab
    }

    Timer
    {
        id: tabSwitcher
        interval: 0
        repeat: false
        property string fileName: "WelcomePage.qml"
        onTriggered: loader.source = fileName
    }

    Shortcut
    {
        sequence: "Esc"
        onActivated:
        {
            loader.source = "WelcomePage.qml"
            programName(false) // Title turns off because the program name is inside the tab
        }
    }
}
