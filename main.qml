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

            spacing: 5

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    console.log(        // 35+5 = width(height) + spacing
                        Math.trunc((listView.contentY + mouseY)/(35+5)),
                        Math.trunc((listView.contentX + mouseX)/(35+5)))
                }
            }

            delegate: RowLayout {

                property int ext_id: index

                spacing: 5

                Repeater {
                     model: 5

                     Button {
                         text: "%1%2".arg(ext_id).arg(index)

                         implicitHeight: 35
                         implicitWidth: 35

                         background: Rectangle {
                            color: "steelblue"
                         }

                         onClicked: {
                             console.log(text)
                         }
                     }
                }
            }
        }
    }
}


