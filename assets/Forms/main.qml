import QtQuick 2.9
import QtQuick.Window 2.3
import QtMultimedia 5.9
import Database 1.0

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


    // Disabling standard title bar
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

    property var radioStations: database.getRadio()
    property var kanaSymbols: database.getKana()

    property int previousSymbolId: -1
    property int randomSymbolId: -1
    property var hiraganaOrKatakana: -1 // if 0 - hiragana, if 1 - katakana. Default is -1 (nothing). See getRandomSymbol() function.


    // Get Random symbol from random alphabet (for Kana Quiz).
    function getRandomSymbol()
    {
        hiraganaOrKatakana = Math.floor(Math.random() * 2)

        if (hiraganaOrKatakana == 0)
        {
            hiraganaOrKatakana = "hiragana"
        }
        else
        {
            hiraganaOrKatakana = "hiragana"
        }

        while (randomSymbolId == previousSymbolId)
        {
            randomSymbolId = Math.floor(Math.random() * kanaSymbols.length)
        }

        previousSymbolId = randomSymbolId
    }


    // Database for use in the program
    Database { id: database }

    // So that the included radio station plays even when you close the "Radio" tab
    Audio { id: audio }

    /*
     * Title bar that replaces the standard
     */

    Rectangle
    {
        id: titleBar
        width: parent.width
        height: 21
        color: "black"
        clip: true

        // Gray line which separete title bar from pages
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
            id: windowDragging
            anchors.fill: parent
            property point lastMousePos: Qt.point(0, 0)

            onPressed:
            {
                lastMousePos = Qt.point(mouseX, mouseY)
            }

            onContainsPressChanged:
            {
                if (containsPress)
                {
                    windowDragging.cursorShape = Qt.ClosedHandCursor
                }
                else
                {
                    windowDragging.cursorShape = Qt.ArrowCursor
                }
            }

            onMouseXChanged: { root.x += (mouseX - lastMousePos.x); pos[0] = ( root.x ) }
            onMouseYChanged: { root.y += (mouseY - lastMousePos.y); pos[1] = ( root.y ) }
        }

        Row
        {
            id: windowControlButtons
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            layoutDirection: Qt.LeftToRight
            width: titleBar.height * 2
            height: titleBar.height

            WindowControlButtons
            {
                imageLocation: "../Images/minimize.svg"
                onClicked: root.visibility = "Minimized"
            }
            WindowControlButtons
            {
                imageLocation: "../Images/close.svg"
                closed: true
                onClicked: root.close()
            }
        }
    }

    /*
     * Panel for switching between tabs
     */

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
        id: tabLoader
        width: parent.width - leftPanel.width
        height: parent.height - titleBar.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        // Automatic loading of the welcome page when the program starts
        source: "WelcomePage.qml"

        // Title turns off because the program name is inside the tab
        Component.onCompleted: programName(false)
    }

    // Timer for switching between tabs
    Timer
    {
        id: tabSwitcher
        property string fileName: ""
        interval: 0
        repeat: false
        onTriggered:
        {
            tabLoader.source = "" // To be able to return to the start page of the tab by clicking on its logo on the left panel
            tabLoader.source = fileName
        }
    }

    // Return to the welcome page when the user presses "Esc"
    Shortcut
    {
        sequence: "Esc"
        onActivated:
        {
            // Title turns off because the program name is inside the tab
            programName(false)
            tabLoader.source = "WelcomePage.qml"
        }
    }
}
