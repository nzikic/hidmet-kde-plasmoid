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

import org.kde.plasma.plasmoid
import org.kde.kirigami as Kirigami

PlasmoidItem {
    id: root

    width: Kirigami.Units.gridUnit * 11
    height: Kirigami.Units.gridUnit * 15

    property int stationId: plasmoid.configuration.stationId

    onStationIdChanged: {
        hidmetAtomFeed.reload()
    }

    HidmetAtomFeed {
        id: hidmetAtomFeed
    }

    HidmetStationModel {
        id: hidmetStationModel

        stationId: root.stationId
        atomFeed: hidmetAtomFeed
    }

    Timer {
        repeat: true
        interval: plasmoid.configuration.reloadIntervalMinutes * 60 * 1000
        running: true

        onTriggered: {
            hidmetAtomFeed.reload();
        }

        onIntervalChanged: {
            hidmetAtomFeed.reload();
            restart();
        }
    }

    fullRepresentation: FullRepresentation { stationData: hidmetStationModel.stationData }
    compactRepresentation: CompactRepresentation {}

//    preferredRepresentation: compactRepresentation
    preferredRepresentation: fullRepresentation

    Component.onCompleted: hidmetAtomFeed.onStatusChanged.connect(hidmetStationModel.update);
}
