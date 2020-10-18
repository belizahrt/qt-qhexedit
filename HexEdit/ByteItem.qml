import QtQuick 2.15

Row {
    id: byteItem

    readonly property alias spacing: byteItem.spacing
    readonly property alias add: byteItem.add

    property int byteWidth: 25
    property int byteHeight: 20
    property int groupSpacing: 5

//    property int value: 0
//    property int offset: -1

//    property bool isLastInGroup: false

    Rectangle {
        implicitWidth: byteWidth
        implicitHeight: byteHeight

        color: "transparent"

        Text {
            anchors.fill: parent

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            font.pixelSize: 12
            font.family: "consolas"

            text: {
               return value.toString(16).toUpperCase().padStart(2, '0');
            }
        }
    }

    Rectangle {
        implicitWidth: groupSpacing
        implicitHeight: byteHeight

        color: "tomato"

        visible: isLastInGroup
    }
}
