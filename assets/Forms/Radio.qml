import QtQuick 2.9
import QtQuick.Layouts 1.3
import Database 1.0
import QtMultimedia 5.9

Item
{
    id: radioTab
    anchors.fill: parent

    Audio
    {
        id: audio
    }

    Database
    {
        id: core
    }

    RowLayout
    {
        anchors.fill: parent
        spacing: 0

        ListView
        {
            id: radioList
            Layout.margins: 5
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2
            clip: true
            model: core.getRadio()
            delegate:
            Rectangle
            {
                width: parent.width
                height: 48
                clip: true
                color: "#362e2e"
                RowLayout
                {
                    anchors.fill: parent
                    Image
                    {
                        id: preview
                        Layout.leftMargin: 7
                        asynchronous: true
                        cache: true
                        fillMode:  Image.Stretch
                        source: modelData ["image_url"]
                        sourceSize: Qt.size(72, parent.height)
                    }
                }

                Text
                {
                    id: title
                    text: qsTr(modelData ["title"])
                    anchors.centerIn: parent
                    font.bold: true
                    font.italic: true
                    color: "#ddff00"
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
            }
        }

        Rectangle
        {
            id: rightPanel
            Layout.fillHeight: true
            width: 128
            color: "black"

            // gray line which separete right panel from radio list
            Rectangle
            {
                id: line
                height: rightPanel.height
                width: 1
                color: "gray"
                anchors.left: parent.left
            }
        }
    }
}
