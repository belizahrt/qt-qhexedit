import QtQuick 2.15

Row {
    id: byteItem

    readonly property alias spacing: byteItem.spacing
    readonly property alias add: byteItem.add

    property int byteWidth: 25
    property int byteHeight: 20
    property int groupSpacing: 5

    property string text: {
        return value.toString(16).toUpperCase().padStart(2, '0');
    }

    property Component contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pixelSize: 12
        font.family: "consolas"

        text: byteItem.text
    }

    Rectangle {
        implicitWidth: byteWidth
        implicitHeight: byteHeight

        color: "transparent"

        Loader {
            sourceComponent: contentItem
            anchors.fill: parent
        }
    }

    Rectangle {
        implicitWidth: groupSpacing
        implicitHeight: byteHeight

        color: "tomato"

        visible: isLastInGroup
    }
}
