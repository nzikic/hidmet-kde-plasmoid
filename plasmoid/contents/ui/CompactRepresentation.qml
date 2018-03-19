import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.XmlListModel 2.0

import org.kde.plasma.components 2.0 as PlasmaComponents

ColumnLayout {
    id: fullrepresentationId

    ListView {
        id: hidmetListViewId
//            anchors.fill: parent
        model: hidmetRssFeedId
        clip: false

        delegate: Item {
            id: itemId
            height: columnId.implicitHeight
            width:  columnId.implicitWidth

            ColumnLayout {
                id: columnId
                //width: 400
                spacing: 5
                anchors.fill: parent
                width: rowid.implicitWidth

                PlasmaComponents.Label { text: station; font { pointSize: 14; bold: true } clip:true}

                RowLayout {
                    id: rowid
                    //width: parent.width
                    //Layout.fillWidth: true
                    Layout.preferredWidth: rootId.plasmoidWidth
//                    spacing: 25

                    Image { source: weather_img_png; /*Layout.alignment: Qt.AlignLeft*/ }
                    PlasmaComponents.Label { text: temperature; font { pointSize: 22 } /*Layout.alignment: Qt.AlignRight*/ }
                    //Text { text: "duzina je bitna!" }
                }

                PlasmaComponents.Label { text: weather_desc; }
                PlasmaComponents.Label { text: "<b>" + qsTr("Притисак: ") + "</b>" + preassure }
                PlasmaComponents.Label { text: "<b>" + qsTr("Брзина ветра: ") + "</b>" + wind_speed }
                PlasmaComponents.Label { text: "<b>" + qsTr("Смер ветра: ") + "</b>" + wind_direction }
            }

            Rectangle {
                anchors.fill: parent
                color: "violet"
                opacity: .5
            }

            MouseArea {
                anchors.fill: parent
                onClicked: console.log("clicked")
            }
        }
    }
}
