import QtQuick 2.9
import QtQuick.Layouts 1.3
import CoreApi 0.1
import QtMultimedia 5.9

Item
{
    Audio
    {
        id: audio
    }


    anchors.fill: parent
    CoreApi
    {
        id: core
    }


    RowLayout
    {
        anchors.fill: parent

        // Displaying list of radiostations.

        ListView
        {
            clip: true
            Layout.margins: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: core.getRadio()

            delegate:
            Rectangle
            {

                clip: true
                RowLayout
                {
                    anchors.fill: parent
                    Image
                    {
                        id: preview
                        Layout.leftMargin: 7
                        source: modelData ["preview"]
                        asynchronous: true
                        width: 72
                        height: parent.height
                        sourceSize: Qt.size(preview.width, preview.height)
                        fillMode:  Image.Stretch
                    }

                    Text
                    {

                        id: name
                        text: qsTr(modelData ["name"])
                        Layout.fillHeight: true
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.italic: true
                        color: "orange"
                    }

                    spacing: 13

                    Rectangle
                    {
                        Layout.fillWidth: true
                    }
                }

                MouseArea
                {
                    anchors.fill: parent

                    onClicked:
                    {
                        audio.source = modelData ["url"]
                        audio.play()
                    }
                }

                width: parent.width
                height: 48
                color: "gray"

            }

            spacing: 2



        }

        spacing: 0


        Rectangle
        {
            id: rightPanel
            Layout.fillHeight: true
            width: 128
            color: "black"

            // Creating an a line on the left side of right panel

            Rectangle
            {
                height: rightPanel.height
                width: 1
                color: "grey"
                anchors.left: parent.left
            }
        }
    }

}
