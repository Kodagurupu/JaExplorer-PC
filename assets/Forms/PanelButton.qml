import QtQuick 2.9

Item
{
    id: root

    property string imageUrl: ""
    property string description: ""

    width: parent.width - 2
    height: 40

    Image
    {
        anchors.fill: parent
        source: imageUrl === "" ? "" : imageUrl
    }

}
