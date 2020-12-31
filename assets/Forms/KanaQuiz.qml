import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

/*
 * The main page of the quiz. Activated by clicking the "Start Quiz" button in [LearnKana.qml].
 */

Item
{
    anchors.fill: parent
    Component.onCompleted: getRandomSymbol()

    Rectangle
    {
        anchors.fill: parent
        color: "black"

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

            Rectangle { Layout.fillHeight: true }

            /*
             * Buttons
             */

            Button
            {
                id: showAnswer
                Layout.alignment: Qt.AlignHCenter
                highlighted: true
                text: "Show Answer"
                // To change the shape of the cursor
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked:
                    {
                        tabLoader.source = "KanaQuizAnswer.qml"
                    }
                }
            }

            RowLayout
            {
                Layout.alignment: Qt.AlignHCenter

                Button
                {
                    id: pauseQuiz
                    highlighted: true
                    text: "Pause"
                    // To change the shape of the cursor
                    MouseArea
                    {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked:
                        {
                            tabLoader.source = "KanaQuizPaused.qml"
                        }
                    }
                }

                Button
                {
                    id: stopQuiz
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
    }
}
