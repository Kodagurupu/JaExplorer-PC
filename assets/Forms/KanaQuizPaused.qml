import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

/*
 * The page that opens when you click the "Pause" button, which is located in [KanaQuiz.qml].
 */

Item
{
    anchors.fill: parent

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
                text: qsTr("Quiz paused")
                color: "white"
            }

            Rectangle { Layout.fillHeight: true }

            Button
            {
                id: returnToQuiz
                highlighted: true
                Layout.alignment: Qt.AlignHCenter
                text: "Return to Quiz"
                // To change the shape of the cursor
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: tabLoader.source = "KanaQuiz.qml"
                }
            }
            Rectangle { Layout.fillHeight: true }
            Rectangle { Layout.fillHeight: true }
        }
    }
}
