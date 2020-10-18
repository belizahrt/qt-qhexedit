import QtQuick 2.15
import QtQuick.Layouts 1.12

RowLayout {
    id: hexRow

    property int groupCount: 4
    property int byteCount: 4

    property variant hexData: 0

    property int row: index

    property Component delegate

    spacing: 0

    Repeater {
        model: groupCount * byteCount

        Loader {
            sourceComponent: delegate

            property bool isLastInGroup: {
                return (index != 0
                     && index != (byteCount*groupCount-1)
                     && (index+1) % byteCount == 0)
            }

            property int offset: {
                var rowOffset = row * (groupCount * byteCount)

                return rowOffset + index
            }

            property int value: hexData[index]
        }
    }
}
