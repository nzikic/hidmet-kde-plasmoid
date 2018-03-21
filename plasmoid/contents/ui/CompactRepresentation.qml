/**
 *  Copyright 2018  Nenad Žikić <nenad.zikic@gmail.com>
 *
 *  This file is part of hidmet-kde-plasmoid.
 *
 *  hidmet-kde-plasmoid is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  hidmet-kde-plasmoid is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with hidmet-kde-plasmoid.  If not, see <http://www.gnu.org/licenses/>.
 */

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
