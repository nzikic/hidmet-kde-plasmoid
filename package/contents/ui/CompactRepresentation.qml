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

import QtQml
import QtQuick
import QtQuick.Layouts

import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid

import "../tools/hidmetUtils.js" as Hidmet


Loader {
    id: rootCompact

    required property var stationData

    readonly property bool vertical: root.plasmoid.formFactor == PlasmaCore.Types.Vertical

    property int iconSize: vertical ? rootCompact.width : rootCompact.height
    property int minimalIconSize: Math.max(iconSize, Kirigami.Units.iconSizes.small)

    Layout.fillWidth: vertical
    Layout.fillHeight: !vertical
    Layout.minimumWidth: root.Layout.minimumWidth ?? 0
    Layout.minimumHeight: root.Layout.minimumHeight ?? 0

    activeFocusOnTab: true

    sourceComponent: {
        switch (plasmoid.configuration.compactViewMode) {
            case Hidmet.CompactView.Icon:
                return componentIcon;
            case Hidmet.CompactView.Temperature:
                return componentTemperature;
            case Hidmet.CompactView.IconAndTemperature:
                return componentIconAndTemperature;
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.expanded = !root.expanded
    }

    Component {
        id: componentTemperature

        PlasmaComponents.Label {
            text: rootCompact.stationData?.temperature ?? "..."

            minimumPixelSize: Kirigami.Units.iconSizes.sizeForLabels
            font.pixelSize: 1024
            fontSizeMode: Text.Fit

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Component {
        id: componentIcon

        Image {
            source: Hidmet.getIconUrl(rootCompact.stationData?.descriptionCode)
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignRight
        }
    }

    Component {
        id: componentIconAndTemperature

        Item {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignHCenter

            RowLayout {
                spacing: 1
                anchors.fill: parent

                Image {
                    source: Hidmet.getIconUrl(rootCompact.stationData?.descriptionCode)
                    fillMode: Image.PreserveAspectFit

                    Layout.minimumWidth: Kirigami.Units.iconSizes.sizeForLabels
                    Layout.minimumHeight: Kirigami.Units.iconSizes.sizeForLabels

                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: parent.height

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                PlasmaComponents.Label {
                    id: lbl
                    text: rootCompact.stationData?.temperature ?? "..."

                    minimumPixelSize: Kirigami.Units.iconSizes.sizeForLabels
                    font.pixelSize: 1024
                    fontSizeMode: Text.Fit

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}
