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
import org.kde.plasma.plasmoid


GridLayout {
    id: rootIconAndText

    property alias imageSource: image.source
    property alias text: label.text

    required property bool vertical

    readonly property int minimumIconSize: Kirigami.Units.iconSizes.small
    readonly property int iconSize: rootIconAndText.vertical ? width : height

    rows: vertical ? 2 : 1
    columns: vertical ? 1 : 2

    rowSpacing: 0
    columnSpacing: 0

    Image {
        id: image

        readonly property int implciitMinimumIconSize: Math.max(rootIconAndText.iconSize, rootIconAndText.minimumIconSize)

        fillMode: Image.PreserveAspectFit

        Layout.fillWidth: rootIconAndText.vertical
        Layout.fillHeight: !rootIconAndText.vertical

        Layout.minimumWidth: Kirigami.Units.iconSizes.sizeForLabels
        Layout.minimumHeight: Kirigami.Units.iconSizes.sizeForLabels

        Layout.preferredWidth: rootIconAndText.vertical ? text.implicitHeight : undefined
        Layout.preferredHeight: rootIconAndText.vertical ? undefined : text.implicitWidth
    }

    Item {
        id: text

        visible: label.text.length > 0

        Layout.fillWidth: rootIconAndText.vertical
        Layout.fillHeight: !rootIconAndText.vertical
        Layout.minimumWidth: rootIconAndText.vertical ? 0 : sizehelper.paintedWidth
        Layout.maximumWidth: rootIconAndText.vertical ? Infinity : Layout.minimumWidth
        Layout.minimumHeight: rootIconAndText.vertical ? sizehelper.paintedHeight : 0
        Layout.maximumHeight: rootIconAndText.vertical ? Layout.minimumHeight : Infinity

        Text {
            id: sizehelper

            visible: false

            // Taken from digital clock and fuzzy clock applets
            height: {
                const textHeightScaleFactor = (parent.height > 26) ? 0.7 : 0.9;
                return Math.min(parent.height * textHeightScaleFactor, Kirigami.Theme.defaultFont.pixelSize * 3);
            }

            fontSizeMode: rootIconAndText.vertical ? Text.HorizontalFit : Text.VerticalFit
            font.pixelSize: rootIconAndText.vertical ? Kirigami.Units.gridUnit * 2 : 1024 // random big enough size, will be used by fontSizeMode
            minimumPixelSize: Math.round(Kirigami.Units.gridUnit / 2)
            wrapMode: Text.NoWrap

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            anchors.leftMargin: Kirigami.Units.smallSpacing
            anchors.rightMargin: Kirigami.Units.smallSpacing

            // pattern to reserve constant space
            text: "888 °C"
            textFormat: Text.PlainText
        }

        PlasmaComponents.Label {
            id: label

            width: 0
            height: 0

            fontSizeMode: Text.Fit
            font.pixelSize: 1024
            minimumPixelSize: Math.round(Kirigami.Units.gridUnit / 2)
            wrapMode: Text.NoWrap

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            anchors.fill: parent
            anchors.leftMargin: Kirigami.Units.smallSpacing
            anchors.rightMargin: Kirigami.Units.smallSpacing
        }
    }
}
