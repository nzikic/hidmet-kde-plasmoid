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

    property int parentHeight: height

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
        id: loader
        sourceComponent: plasmoid.configuration.compactLayout == 0 ? iconCmpId : temperatureCmpId

        Layout.fillWidth: vertical
        Layout.fillHeight: !vertical
        Layout.minimumWidth: item.Layout.minimumWidth
        Layout.minimumHeight: item.Layout.minimumHeight
    }

    MouseArea {
        anchors.fill: parent

        onClicked: plasmoid.expanded = !plasmoid.expanded;
    }

    Component {
        id: iconCmpId

        PlasmaCore.IconItem {
            id: icon_item_id
            property int minimalIconSize: Math.max((vertical ? compactrepresentationId.width : compactrepresentationId.height),
                                                   units.iconSizes.small)
            source: weather_img_png

            implicitWidth: units.iconSizes.small
            implicitHeight: units.iconSizes.small
            Layout.minimumWidth: vertical ? units.iconSizes.small : minimalIconSize
            Layout.minimumHeight: vertical ? minimalIconSize : units.iconSizes.small
        }
    }

    Component {
        id: temperatureCmpId

        PlasmaComponents.Label {
            id: temperatureText

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            text: rootId.temperature
            font.pixelSize: parentHeight * .7
            font.pointSize: -1
        }
    }

    Plasmoid.icon           : weather_img_png
    Plasmoid.toolTipMainText: rootId.queryStation
    Plasmoid.toolTipSubText : createSubText(rootId.weather_desc, rootId.temperature)
}
