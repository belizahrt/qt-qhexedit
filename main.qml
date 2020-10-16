import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Window")

    color: "lightgray"

    ScrollView {
        anchors.fill: parent

        ListView {
            id: listView

            width: parent.width
            model: 20

            property int col: -1
            property int row: -1

            MouseArea {
                anchors.fill: parent

                preventStealing: true
                hoverEnabled: true

                onClicked: {
                    console.log("clicked on", listView.col, listView.row)
                }

                onPositionChanged: {
                    listView.col = Math.trunc((listView.contentY + mouseY)/20)
                    listView.row = Math.trunc((listView.contentX + mouseX)/25)
                }

                onHoveredChanged: {
                    if (!containsMouse) {
                        listView.col = -1
                        listView.row = -1
                    }
                }
            }

            delegate: RowLayout {

                property int ext_id: index

                spacing: 0

                Repeater {
                     model: 8

                     Rectangle {
                         implicitHeight: 20
                         implicitWidth: 25

                         color: {
                             if (listView.col == ext_id && listView.row == index)
                                return "lightsteelblue"
                             else
                                return "transparent"
                         }

                         Text {
                             anchors.centerIn: parent

                             text: "%1 %2".arg(ext_id).arg(index)
                         }
                     }
                }
            }
        }
    }
}


