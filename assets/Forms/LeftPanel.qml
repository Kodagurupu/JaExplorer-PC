import QtQuick 2.0
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
            model: [ {"imageUrl" : "qrc:/assets/Images/news.png"} ]
            delegate: PanelButton
            {
                imageUrl: modelData["imageUrl"]
            }
        }
    }

}
