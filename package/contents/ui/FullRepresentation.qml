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


ColumnLayout {
    id: rootFull

    required property var stationData

    spacing: 5

    Layout.preferredWidth: Math.max(Kirigami.Units.gridUnit * 9, implicitWidth)
    Layout.preferredHeight: Math.max(Kirigami.Units.gridUnit * 11, implicitHeight)

    PlasmaComponents.Label {
        text: Hidmet.stations[rootFull.stationData?.id]
        font { pointSize: 14; bold: true }
        Layout.alignment: Qt.AlignHCenter
    }

    RowLayout {
        spacing: 0

        Layout.alignment: Qt.AlignHCenter

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
    }

    PlasmaComponents.Label {
        readonly property url hidmet_link: "https://hidmet.gov.rs/"

        text: `<a href="${hidmet_link}">hidmet.gov.rs</a>`

        horizontalAlignment: Text.AlignRight
        Layout.alignment: Qt.AlignRight

        onLinkActivated: Qt.openUrlExternally(hidmet_link);
    }
}
