import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

import "HexEdit" as HexComponents

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
            model: 100

            property int col: -1
            property int row: -1

            MouseArea {
                anchors.fill: parent

                preventStealing: true
                hoverEnabled: true

                cursorShape: Qt.IBeamCursor

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

                onPressed: {
                    console.log("pressed on", listView.col, listView.row)
                }

                onReleased: {
                    console.log("released on", listView.col, listView.row)
                }
            }

            delegate: HexComponents.HexRow {
                byteCount: 4
                groupCount: 4

                spacing: 10

                hexData: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
            }
        }
    }
}


