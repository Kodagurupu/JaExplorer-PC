import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Item
{
    id: tableHiragana

    /*property var kanaArray: database.kanaModel

    function changeKanaArray()
    {
        kanaArray.splice(36, 0, " ")
        kanaArray.splice(38, 0, " ")
        kanaArray.splice(46, 0, " ", " ", " ")
        kanaArray.splice(53, 0, " ", " ", " ", " ")
        hiragana.model = kanaArray
    }*/

    ColumnLayout
    {
        anchors.fill: parent

        Rectangle { Layout.fillHeight: true }

        Text
        {
            id: howToReadHiragana
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            font.italic: true
            font.pixelSize: 16
            text: qsTr("Top to bottom ↓, right to left ←")
            color: "gray"
        }

        Rectangle { Layout.fillHeight: true }

        /*
         * Hiragana Table
         */

        GridView
        {
            id: hiragana

            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            height: parent.height - 128
            width: parent.width - 88

            flow: GridView.TopToBottom
            layoutDirection: GridView.RightToLeft
            verticalLayoutDirection: GridView.TopToBottom
            interactive: false

            cellHeight: 64
            cellWidth: 46
            clip: true

            model: database.kanaModel

            delegate: Rectangle
            {
                height: 62
                width: 44
                color: "#708090"

                Text
                {
                    id: symbol
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 3
                    font.pixelSize: 32
                    text: modelData["hiragana"]
                    color: "black"
                }

                Text
                {
                    id: pronunciation
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 7
                    font.pixelSize: 16
                    text: modelData["pronunciation"]
                    color: "black"
                }
            }
        }

        /*
         * Buttons
         */

        RowLayout
        {
            Rectangle { Layout.fillWidth: true }

            Button
            {
                id: goBack
                Layout.alignment: Qt.AlignLeft
                highlighted: true
                font.pixelSize: 12
                text: "<< Go Back"
                // To change the shape of the cursor
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: tabLoader.source = "LearnKana.qml"
                }
            }

            Rectangle { Layout.fillWidth: true }
            Rectangle { Layout.fillWidth: true }

            Button
            {
                id: combinations
                Layout.alignment: Qt.AlignHCenter
                highlighted: true
                font.pixelSize: 12
                text: "Combinations"
                // To change the shape of the cursor
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: { combinations.text = "⋆✦⋆ Soon ⋆✦⋆"
                                 console.log("TableHiragana.combinations: Soon...") }
                }
            }

            Rectangle { Layout.fillWidth: true }
            Rectangle { Layout.fillWidth: true }

            Button
            {
                id: goKatakana
                Layout.alignment: Qt.AlignRight
                highlighted: true
                font.pixelSize: 12
                text: "Katakana >>"
                // To change the shape of the cursor
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: tabLoader.source = "TableKatakana.qml"
                }
            }
            Rectangle { Layout.fillWidth: true }
        }
        Rectangle { Layout.fillHeight: true }
    }
}
