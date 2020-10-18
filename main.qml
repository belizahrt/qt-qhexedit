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

    Flickable {
        anchors.fill: parent
        contentWidth: hexEdit.contentWidth
        contentHeight: hexEdit.contentHeight

        ScrollBar.vertical: ScrollBar {
            active: true
            stepSize: 20
        }

        boundsBehavior: Flickable.StopAtBounds

        ListView {
            id: hexEdit

            cacheBuffer: 1000

            width: parent.width
            height: parent.height
            model: 100

            property int col: -1
            property int row: -1

            delegate: HexComponents.HexRow {
                byteCount: 4
                groupCount: 4

                hexData: [17, 1, 35, 45, 25, 0, 64, 8, 255, 10, 131, 228, 28, 114, 175, 16]

                delegate: HexComponents.ByteItem {
                    id: byteItem


                }
            }
        }
    }
}

//MouseArea {
//    anchors.fill: parent

//    preventStealing: true
//    hoverEnabled: true

//    cursorShape: Qt.IBeamCursor

//    onPositionChanged: {
//        hexEdit.col = Math.trunc((hexEdit.contentY + mouseY)/20)
//        hexEdit.row = Math.trunc((hexEdit.contentX + mouseX)/25)
//    }

//    onHoveredChanged: {
//        if (!containsMouse) {
//            hexEdit.col = -1
//            hexEdit.row = -1
//        }
//    }

//    onPressed: {
//        console.log("pressed on", hexEdit.col, hexEdit.row)
//    }

//    onReleased: {
//        console.log("released on", hexEdit.col, hexEdit.row)
//    }
//}
