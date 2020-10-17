import QtQuick 2.15
import QtQuick.Layouts 1.12

RowLayout {
    id: hexRow

    property int groupCount: 4
    property int byteCount: 4

    property variant hexData: 0

    Repeater {
        id: hexGroup

        model: groupCount

        RowLayout{
            spacing: 0

            property int groupIndex: index

            Repeater {
                model: byteCount

                ByteItem {
                    value: {
                        var start = groupIndex * byteCount
                        var end = start + byteCount

                        return hexData.slice(start, end)[index]
                    }

                    //Math.floor(Math.random() * Math.floor(255))
                }
            }
        }
    }
}

