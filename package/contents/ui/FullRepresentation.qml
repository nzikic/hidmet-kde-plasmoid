/**
 *  Copyright 2024  Nenad Žikić <nenad.zikic@gmail.com>
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

import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PlasmaComponents

import "../tools/hidmetUtils.js" as Hidmet

Item {
    id: rootFull

    required property var stationData

    width: layoutColumn.implicitWidth
    height: layoutColumn.implicitHeight

    ColumnLayout {
        id: layoutColumn
        spacing: 5

        width: implicitWidth
        height: implicitHeight

        anchors.fill: parent

        PlasmaComponents.Label {
            text: Hidmet.stations[rootFull.stationData?.id]
            font { pointSize: 14; bold: true }
            Layout.alignment: Qt.AlignHCenter
        }

        RowLayout {
            spacing: 0

            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter

            Item { Layout.fillWidth: true }

            Image {
                source: Hidmet.getIconUrl(rootFull.stationData?.descriptionCode)
                Layout.alignment: Qt.AlignRight
            }

            PlasmaComponents.Label {
                id: lblTemerature
                text: rootFull.stationData?.temperature
                font.pointSize: 22
                Layout.alignment: Qt.AlignLeft
            }

            Item { Layout.fillWidth: true }
        }

        PlasmaComponents.Label {
            text: rootFull.stationData?.description
            Layout.alignment: Qt.AlignHCenter
        }

        Kirigami.FormLayout {
            Layout.alignment: Qt.AlignHCenter

            PlasmaComponents.Label {
                text: rootFull.stationData?.humidity
                Layout.alignment: Qt.AlignHCenter
                Kirigami.FormData.label: i18n("Влажност:")
            }

            PlasmaComponents.Label {
                text: rootFull.stationData?.windSpeed
                Layout.alignment: Qt.AlignHCenter
                Kirigami.FormData.label: i18n("Брзина ветра:")
            }

            PlasmaComponents.Label {
                text: rootFull.stationData?.preassure
                Layout.alignment: Qt.AlignHCenter
                Kirigami.FormData.label: i18n("Притисак:")
            }

            Item { Kirigami.FormData.isSection: true }
        }

        PlasmaComponents.Label {
            text: '<a href="https://hidmet.gov.rs/">hidmet.gov.rs</a>'
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignRight
        }
    }
}
