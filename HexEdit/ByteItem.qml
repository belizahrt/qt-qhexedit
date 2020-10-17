import QtQuick 2.15

Item {
    implicitWidth: 25
    implicitHeight: 20

    property int value: 0

    Rectangle {
        anchors.fill: parent

        color: "white"

        Text {
            anchors.centerIn: parent

            text: {
               return value.toString(16).toUpperCase().padStart(2, '0');
            }
        }
    }
}
