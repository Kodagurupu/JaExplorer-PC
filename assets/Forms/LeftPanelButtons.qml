import QtQuick 2.9

Item
{
    id: leftPanelButtons

    property string imageUrl: ""

    width: parent.width - 2
    height: 40

    Image
    {
        anchors.fill: parent
        source: imageUrl
    }

}
