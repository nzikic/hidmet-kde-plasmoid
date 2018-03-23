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

import QtQuick 2.7
import QtQuick.Layouts 1.0

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents


ColumnLayout {
    id: compactrepresentationId

    function createSubText(description, temperature) {
        var hasDesc = description !== undefined
        var hasTemp = temperature !== undefined

        if (!hasDesc && !hasTemp) {
            return "Подаци се учитавају..."
        }
        else {
            return (hasDesc ? description : "") + "   " + (hasTemp ? temperature : "")
        }
    }

    Loader {
        sourceComponent: iconCmpId

        Layout.fillWidth: compactrepresentationId.height > compactrepresentationId.width
        Layout.fillHeight: compactrepresentationId.width > compactrepresentationId.height
        Layout.minimumWidth: item.Layout.minimumWidth
        Layout.minimumHeight: item.Layout.minimumHeight

        MouseArea {
            anchors.fill: parent

            onClicked: plasmoid.expanded = !plasmoid.expanded;
        }
    }

    Component {
        id: iconCmpId

        PlasmaCore.IconItem {
            id: icon_item_id
            property int minimalIconSize: Math.max(Math.min(compactrepresentationId.width, compactrepresentationId.height),
                                                   units.iconSizes.small)
            source: Qt.resolvedUrl(rootId.weather_img_png)

            implicitWidth: units.iconSizes.small
            implicitHeight: units.iconSizes.small
            Layout.minimumWidth: minimalIconSize
            Layout.minimumHeight: minimalIconSize
        }
    }

    Plasmoid.icon           : Qt.resolvedUrl(rootId.weather_img_png)
    Plasmoid.toolTipMainText: rootId.queryStation
    Plasmoid.toolTipSubText : createSubText(rootId.weather_desc, rootId.temperature)
}
