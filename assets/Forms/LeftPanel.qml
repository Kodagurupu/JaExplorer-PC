import QtQuick 2.9
import QtQuick.Layouts 1.3

Item
{
    id: leftPanel

    signal enableNameDisplay
    signal disableNameDisplay
    property var switchFunc: leftPanel.switchFunc

    Rectangle
    {
        id: panel
        anchors.fill: parent
        color: "black"

        // gray line which separete panel from pages
        Rectangle
        {
            anchors.right: parent.right
            height: parent.height
            width: 1
            radius: 5
            color: "gray"
        }

        // Tab list
        ListView
        {
            anchors.fill: parent
            clip: true
            spacing: 10
            model:
            [
                {"imageUrl" : "qrc:/assets/Images/news.png"},
                {"imageUrl" : "qrc:/assets/Images/words.png"},
                {"imageUrl" : "qrc:/assets/Images/favourites.png"},
                {"imageUrl" : "qrc:/assets/Images/kana_a.png"},
                {"imageUrl" : "qrc:/assets/Images/kanji.png"},
                {"imageUrl" : "qrc:/assets/Images/video.png"},
                {"imageUrl" : "qrc:/assets/Images/radio.png"},
                {"imageUrl" : "qrc:/assets/Images/options.png"}
            ]
            delegate: PanelButton
            {
                imageUrl: modelData["imageUrl"]

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        if (index == 0)
                        {
                            switchFunc.fileName = "News.qml"
                            switchFunc.start()
                            enableNameDisplay()
                        }
                        if (index == 1)
                        {
                            switchFunc.fileName = "SavedWords.qml"
                            switchFunc.start()
                            enableNameDisplay()
                        }
                        if (index == 2)
                        {
                            switchFunc.fileName = "Favourites.qml"
                            switchFunc.start()
                            enableNameDisplay()
                        }
                        if (index == 3)
                        {
                            switchFunc.fileName = "LearnKana.qml"
                            switchFunc.start()
                            enableNameDisplay()
                        }
                        if (index == 4)
                        {
                            switchFunc.fileName = "LearnKanji.qml"
                            switchFunc.start()
                            enableNameDisplay()
                        }
                        if (index == 5)
                        {
                            switchFunc.fileName = "Videos.qml"
                            switchFunc.start()
                            enableNameDisplay()
                        }
                        if (index == 6)
                        {
                            switchFunc.fileName = "Radio.qml"
                            switchFunc.start()
                            enableNameDisplay()
                        }
                        if (index == 7)
                        {
                            switchFunc.fileName = "Options.qml"
                            switchFunc.start()
                            disableNameDisplay() // Title turns off because the program name is inside the tab
                        }
                    }
                }
            }
        }
    }
}
