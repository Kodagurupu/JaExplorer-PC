import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

/*
 * The main page that opens when you go to the "Learn kana" tab on the left panel.
 */

Item
{
    id: kanaTabPages
    anchors.fill: parent

    ColumnLayout
    {
        anchors.fill: parent

        Rectangle { Layout.fillHeight: true }

        Text
        {
            id: tabName
            Layout.alignment: Qt.AlignHCenter
            font.bold: true
            font.italic: true
            font.pixelSize: 32
            text: qsTr("Learn Hiragana & Katakana")
            color: "lightgray"
        }

        Rectangle { Layout.fillHeight: true }

        Button
        {
            id: combinations
            highlighted: true
            Layout.alignment: Qt.AlignHCenter
            text: "Combinations"
            // To change the shape of the cursor
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: { combinations.text = "⋆✦⋆ Soon ⋆✦⋆"
                             console.log("kanaTabPages.combinations: Soon...") }
            }
        }

        RowLayout
        {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Rectangle
            {
                Layout.fillWidth: true

                Button
                 {
                     id: learnHiragana
                     highlighted: true
                     anchors.right: parent.right
                     anchors.verticalCenter: parent.verticalCenter
                     text: "Hiragana"
                     // To change the shape of the cursor
                     MouseArea
                     {
                         anchors.fill: parent
                         cursorShape: Qt.PointingHandCursor
                         onClicked: tabLoader.source = "TableHiragana.qml"
                     }
                 }
            }

            Rectangle { width: 5 }

            Image
            {
                id: pageImage
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                fillMode: Image.Stretch
                source: "../Images/learnKana.png"
                sourceSize: Qt.size(parent.height, parent.width)
            }

            Rectangle { width: 5 }

            Rectangle
            {
                Layout.fillWidth: true

                Button
                {
                    id: learnKatakana
                    highlighted: true
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Katakana"
                    // To change the shape of the cursor
                    MouseArea
                    {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: tabLoader.source = "TableKatakana.qml"
                    }
                }
            }
        }

        Button
        {
            id: startQuiz
            highlighted: true
            Layout.alignment: Qt.AlignHCenter
            text: "Start Quiz"
            // To change the shape of the cursor
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked:
                {
                    if (database.kanaModel.length > 1)
                    {
                        tabLoader.source = "KanaQuiz.qml"
                    }
                    else
                    {
                        tabLoader.source = "DatabaseError.qml"
                    }
                }
            }
        }
        Rectangle { Layout.fillHeight: true }
        Rectangle { Layout.fillHeight: true }
    }
}
