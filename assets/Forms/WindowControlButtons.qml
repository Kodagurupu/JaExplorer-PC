import QtQuick 2.9
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Item {
    id: windowControlButtons

    width: parent.height
    height: parent.height

    signal clicked()

    property bool closed: false

    property string imageLocation: ""

    Rectangle
    {
        id: controlButtons
        anchors.fill: parent
        color: "black"

        Image
        {
            id: image
            mipmap: true
            anchors.centerIn: parent
            sourceSize: Qt.size(17, 17)
            source: imageLocation
        }

        ColorOverlay
        {
            id: colorInsideImage
            anchors.fill: image
            source: image
            color:  "#808080"
            antialiasing: true
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            propagateComposedEvents: true
            onHoveredChanged:
            {
                if ( containsMouse )
                {
                    controlButtons.color = closed ? "#E81123" : "black"
                    colorInsideImage.color = "lightblue"
                }
                else
                {
                    controlButtons.color = "black"
                    colorInsideImage.color = "#808080"
                }
            }
            onClicked: windowControlButtons.clicked()
        }
    }
}
