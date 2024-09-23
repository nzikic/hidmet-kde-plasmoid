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
import QtQml.XmlListModel

import "../tools/logger.js" as Logger


XmlListModel {
    id: root

    source: "https://www.hidmet.gov.rs/ciril/osmotreni/index.xml"
    query: `/feed/entry`

    XmlListModelRole { name: "id"; elementName: "id" }
    XmlListModelRole { name: "title"; elementName: "title" }
    XmlListModelRole { name: "summary"; elementName: "summary" }

    onStatusChanged: (status) => {
        switch (status) {
            case XmlListModel.Loading:
                Logger.debug("Hidmet atom feed loading");
                return;
            case XmlListModel.Ready:
                Logger.debug(`Hidmet atom feed loaded - count: ${count}`);
                return;
            case XmlListModel.Error:
                Logger.debug(`Hidmet atom feed encountered error: ${errorString()}`);
                return;
            case XmlListModel.Null:
                Logger.debug("Hidmet atom feed null)");
                return;
        }
    }
}
