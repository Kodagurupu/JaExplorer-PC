import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtMultimedia 5.9

Item
{
    id: radioTab
    anchors.fill: parent

    function checkDatabase()
    {
        if (database.radioModel.length <= 0)
        {
            tabLoader.source = "DatabaseError.qml"
        }
    }

    Component.onCompleted: checkDatabase()

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
            model: database.radioModel
            delegate:
            Rectangle
            {
                width: parent.width
                height: 48
                clip: true
                color: "#221d1d"
                RowLayout
                {
                    anchors.fill: parent
                    Image
                    {
                        id: preview
                        Layout.leftMargin: 7
                        asynchronous: true
                        cache: true
                        fillMode: Image.Stretch
                        source: modelData ["preview_url"]
                        sourceSize: Qt.size(72, parent.height)
                    }
                }

                Text
                {
                    id: title
                    text: modelData ["title"]
                    anchors.centerIn: parent
                    font.bold: true
                    font.italic: true
                    color: "#ddff00"
                }

                MouseArea
                {
                    anchors.fill: parent
                    scrollGestureEnabled: true
                    onClicked:
                    {
                        audio.source = modelData ["url"]
                        audio.play()
                    }
                }

                Image
                {
                    id: site
                    anchors.right: parent.right
                    anchors.rightMargin: 7
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.Stretch
                    source: "../Images/site.png"
                    sourceSize: Qt.size(28, 28)

                    MouseArea
                    {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: Qt.openUrlExternally(modelData["site"])
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
                anchors.left: parent.left
                height: rightPanel.height
                width: 1
                color: "gray"
            }
        }
    }
}
