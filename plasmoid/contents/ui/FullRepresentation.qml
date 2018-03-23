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

Column {
    id: fullrepresentationId

    Layout.minimumWidth: units.gridUnit * 9
    Layout.minimumHeight: units.gridUnit * 11
    Layout.preferredWidth: units.gridUnit * 9
    Layout.preferredHeight: units.gridUnit * 11

    spacing: 5

    ListView {
        id: hidmetListViewId
        model: hidmetRssFeedId
        clip: false
        anchors {
            top: fullrepresentationId.top
        }

        delegate: Item {
            id: itemId
            height: columnId.implicitHeight
            width: fullrepresentationId.width

            ColumnLayout {
                id: columnId
                spacing: 5
                anchors.fill: parent

                // Station label
                PlasmaComponents.Label { text: station; font { pointSize: 14; bold: true } Layout.alignment: Qt.AlignHCenter }

                RowLayout {
                    id: rowid

                    Layout.fillWidth: true
                    Layout.minimumWidth: parent.width
                    Layout.preferredWidth: parent.width

                    Image { source: weather_img_png; Layout.alignment: Qt.AlignRight }
                    PlasmaComponents.Label { text: temperature; font { pointSize: 22 } Layout.alignment: Qt.AlignLeft }
                }

                // Weather description
                PlasmaComponents.Label { text: weather_desc; Layout.alignment: Qt.AlignHCenter }

                // Details
                GridLayout {
                    columns: 2
                    visible: rootId.isExpanded
                    Layout.alignment: Qt.AlignHCenter

                    PlasmaComponents.Label {
                        text: qsTr("Притисак: ")
                        font.weight: Font.Bold
                        Layout.row: 0; Layout.column: 0
                        Layout.alignment: Qt.AlignRight
                    }

                    PlasmaComponents.Label {
                        text: preassure
                        Layout.row: 0
                        Layout.column: 1
                        Layout.alignment: Qt.AlignLeft
                    }

                    PlasmaComponents.Label {
                        text: qsTr("Брзина ветра: ")
                        font.weight: Font.Bold
                        Layout.row: 1; Layout.column: 0
                        Layout.alignment: Qt.AlignRight
                    }

                    PlasmaComponents.Label {
                        text: wind_speed
                        Layout.row: 1; Layout.column: 1
                        Layout.alignment: Qt.AlignLeft
                    }

                    PlasmaComponents.Label {
                        text: qsTr("Смер ветра: ");
                        font.weight: Font.Bold;
                        Layout.row: 2; Layout.column: 0;
                        Layout.alignment: Qt.AlignRight
                    }

                    PlasmaComponents.Label {
                        text: wind_direction
                        //font.pointSize: 8
                        Layout.row: 2
                        Layout.column: 1
                        Layout.alignment: Qt.AlignLeft
                    }
                }
            }
        }
    }

    PlasmaComponents.Label {
        id: externalLinkId;
        readonly property url hidmet_link: "http://hidmet.gov.rs";

        text: "<a href=\"" + hidmet_link + "\">" + hidmet_link + "</a>"
        linkColor: color
        opacity: .5

        font.underline: true
        font.pointSize: theme.smallestFont.pointSize

        horizontalAlignment: Text.AlignRight

        anchors {
            bottom: parent.bottom
            right: parent.right
        }

        onLinkActivated: Qt.openUrlExternally(link)
    }
}
