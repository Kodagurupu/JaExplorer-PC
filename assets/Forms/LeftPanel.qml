import QtQuick 2.9
import QtQuick.Layouts 1.3

Item
{
    id: root

    property var switchFunc: root.switchFunc

    // Panel space
    Rectangle
    {
        id: panel
        anchors.fill: parent
        color: "black"

        // right grey line which separete panel from pages
        Rectangle
        {
            anchors.right: parent.right
            height: parent.height
            width: 1
            radius: 5
            color: "grey"
        }

        // List of pages preview
        ListView
        {
            anchors.fill: parent
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
                        if (index == 6)
                        {
                            switchFunc.fileName = "Radio.qml"
                            switchFunc.start()
                        }
                    }
                }
            }


        }

    }

}
