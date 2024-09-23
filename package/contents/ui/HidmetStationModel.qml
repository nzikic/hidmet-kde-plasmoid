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

import "../tools/hidmetUtils.js" as Hidmet


Item {
    id: root

    property alias atomFeed: delegateModel.model

    required property int stationId

    property var stationData: (Hidmet.newEmptyStationData())

    function update() { delegateModel.update() }

    onStationIdChanged: update()

    DelegateModel {
        id: delegateModel

        function isSelectedStation(item) {
            return item.id.split('-')[1] == root.stationId
        }

        function updateData(summary) {
            let parsed = Hidmet.parseStationSummary(summary);
            root.stationData = Hidmet.transformKeys_CyrToEng(parsed);
        }

        function update() {
            for (let i = 0; i < items.count; ++i) {
                let item = items.get(i).model;
                if (!isSelectedStation(item)) {
                    continue;
                }

                updateData(item.summary);
                return;
            }

            updateData(null);
        }
    }
}
