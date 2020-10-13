import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
<<<<<<< HEAD
    title: qsTr("Window")
=======
    title: qsTr("Scroll")
>>>>>>> 821b20ce8155fdc68285e7726ddae4662ec246c0

    ScrollView {
        anchors.fill: parent

        ListView {
            id: listView
            width: parent.width
            model: 20
            delegate: ItemDelegate {
                text: "Item " + (index + 1)
                width: listView.width
            }
        }
    }
}
