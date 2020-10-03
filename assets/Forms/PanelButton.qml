import QtQuick 2.0

Item
{
    id: root

    property string imageUrl: root.imageUrl
    property string description: ""

    anchors.fill: parent

    Image
    {
        anchors.fill: parent
        source: imageUrl
    }

}
