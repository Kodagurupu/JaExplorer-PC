import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

Window
{
    /*
     * Set default params
     */
    id: root
    width: 720
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"
    opacity: 0.95

    // Allow translucent background
    flags: Qt.Window | Qt.CustomizeWindowHint

    property var pos: [ Screen.width / 2 - 320, Screen.height / 2 - 240 ]
    property var normal: [640, 480]
    property var maximized: [Screen.width, Screen.height - 1]

    function maximize()
    {
        root.width = maximized[0]
        root.height = maximized[1]
        root.setX(0)
        root.setY(0)
    }

    function setNormal( position )
    {
        root.width = normal[0]
        root.height = normal[1]
        wind.windowMaximized = true
        if ( typeof(position) != "undefined" )
        {
            root.x = ( position.x - root.width / 2 )
            root.y = pos2   // dont know but it work
        } else
        {
            root.setX( pos[0] )
            root.setY( pos[1] )
        }
    }

    Rectangle
    {
        id: bar
        width: parent.width
        height: 21
        color: "black"
        clip: true

        Rectangle
        {
            anchors.bottom: parent.bottom
            color: "grey"
            width: parent.width
            height: 1
        }

        MouseArea {
            anchors.fill: parent
            property bool maximized: !wind.windowMaximized
            property point lastMousePos: Qt.point(0, 0)
            onPressed:
            {
                if ( maximized ) setNormal( Qt.point(mouseX, mouseY) )
                lastMousePos = Qt.point(mouseX, mouseY)
            }
            onMouseXChanged: { root.x += (mouseX - lastMousePos.x); pos[0] = ( root.x ) }
            onMouseYChanged: { root.y += (mouseY - lastMousePos.y); pos[1] = ( root.y ) }
        }

        Row {
            anchors.right: parent.right
            layoutDirection: Qt.LeftToRight
            width: bar.height * 3
            height: bar.height

            UpButton
            {
                image: "qrc:/assets/Images/minimize.svg"
                onClicked: root.visibility = "Minimized"
            }
            UpButton
            {
                id: wind
                image: "qrc:/assets/Images/windowed.svg"
                subImage: "qrc:/assets/Images/maximize.svg"
                windowMaximized: true
                onClicked: {
                    if ( windowMaximized ) {
                        windowMaximized = false
                        maximize()
                    } else {
                        windowMaximized = true
                        setNormal()
                    }
                }
            }
            UpButton
            {
                image: "qrc:/assets/Images/remove.svg"
                closed: true
                onClicked: root.close()
            }
        }
    }

    // Init left panel
    LeftPanel
    {
        id: leftPanel
        width: 42
        height: parent.height - bar.height
        // transfer function
        switchFunc: switchFunc
        anchors.bottom: parent.bottom
    }

    // fake function
    Timer
    {
        id: switchFunc
        interval: 0
        repeat: false
        // dynamic name for switching
        property string fileName: "WelcomePage.qml"

        onTriggered:
        {
            loader.source = fileName
        }
    }

    // Pages
    Loader
    {
        id: loader
        width: parent.width - leftPanel.width
        height: parent.height - bar.height
        anchors.right: parent.right
        source: "WelcomePage.qml"
        anchors.bottom: parent.bottom
    }

    onWidthChanged: if ( wind.windowMaximized == true ) normal[0] = root.width
    onHeightChanged: if ( wind.windowMaximized == true ) normal[1] = root.height
}
