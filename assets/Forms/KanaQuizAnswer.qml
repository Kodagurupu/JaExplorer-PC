import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

/*
 * The page that opens when you click the "Show Answer" button, which is located in [KanaQuiz.qml].
 */

Item
{
    anchors.fill: parent

    Rectangle
    {
        anchors.fill: parent
        color: "black"

        Component.onCompleted: nextSymbol.start()

        ColumnLayout
        {
            anchors.fill: parent

            Rectangle { Layout.fillHeight: true }

            Text
            {
                id: quizQuestion
                Layout.alignment: Qt.AlignHCenter
                font.bold: true
                font.italic: true
                font.pixelSize: 24
                text: qsTr("How to pronounce this symbol?")
                color: "lightgray"
            }

            Rectangle { Layout.fillHeight: true }

            Text
            {
                id: kanaSymbol
                Layout.alignment: Qt.AlignHCenter
                font.bold: true
                font.pixelSize: 98 // Do not touch this ;D
                text: database.kanaModel[randomSymbolId][hiraganaOrKatakana]
                color: "white"
            }

            Text
            {
                id: pronunciation
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 38 // Do not touch this ;D
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                text: database.kanaModel[randomSymbolId]["pronunciation"]
                color: "lightgray"
            }

            Rectangle { Layout.fillHeight: true }

            /*
             * Buttons
             */

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter

                Button
                {
                    id: pauseQuiz
                    Layout.alignment: Qt.AlignHCenter
                    highlighted: true
                    text: "Pause"
                    // To change the shape of the cursor
                    MouseArea
                    {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: tabLoader.source = "KanaQuizPaused.qml"
                    }
                }

                Button
                {
                    id: stopQuiz
                    Layout.alignment: Qt.AlignHCenter
                    highlighted: true
                    text: "Stop"
                    // To change the shape of the cursor
                    MouseArea
                    {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: tabLoader.source = "LearnKana.qml"
                    }
                }
            }
            Rectangle { Layout.fillHeight: true }
        }

        Timer
        {
            id: nextSymbol
            repeat: false
            interval: 1850
            onTriggered: tabLoader.source = "KanaQuiz.qml"
        }
    }
}
