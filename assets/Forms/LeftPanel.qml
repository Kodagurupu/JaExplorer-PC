import QtQuick 2.0
import QtQuick.Layouts 1.3

Item
{
    id: root
    width: 42
    height: parent.height

    property var switchFunc: root.switchFunc


    Rectangle
    {
        id: panel
        anchors.fill: parent
        color: "black"

        Rectangle
        {
            anchors.right: parent.right
            color: "grey"
            width: 1
            height: parent.height
        }

        ColumnLayout
        {
            anchors.fill: parent
            spacing: 10

            PanelButton
            {
                imageUrl: ""
            }
        }
    }

}
