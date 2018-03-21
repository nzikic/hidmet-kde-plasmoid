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

import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.XmlListModel 2.0

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents


Item {
    id: rootId

    property int    stationId
    property string station
    property string temperature
    property string preassure
    property string wind_direction
    property string wind_speed
    property string weather_desc
    property string code            : "0"
    property string weather_img_png : "http://www.hidmet.gov.rs/repository/ikonice/osmotreni/" + code + ".png"
    property string weather_img_gif : "http://www.hidmet.gov.rs/repository/ikonice/osmotreni/" + code + ".gif"

    // keys
    property string key_temperature : "Температура"
    property string key_pressure    : "Притисак"
    property string key_wind_dir    : "Правац ветра"
    property string key_wind_speed  : "Брзина ветра"
    property string key_humidity    : "Влажност"
    property string key_description : "Опис времена"
    property string key_code        : "Шифра описа времена"

    property int    refresh_interval_minutes: 10
    property bool   isExpanded: true

    function parse_description(description) {
        var dsc;

        dsc = description; // :: String
        dsc = dsc.split(';') // :: [String]
        dsc = dsc.filter(function(s){
            return s.indexOf(':') !== -1;
        }) // :: [String]
        dsc = dsc.map(function(s){
            var sp = s.split(':')
            return {
                key: sp[0].trim(),
                value: sp[1].trim()
            }
        }) // :: [ {key: String, value: String} ]
        dsc = dsc.reduce(function(acc, v){
            acc[v.key] = v.value;
            return acc;
        }, {}) // :: Object...

        for(var key in dsc) {
            console.log('*' + key + '* -> *' + dsc[key] + '*' )
        }

        temperature      = dsc[key_temperature]
        preassure        = dsc[key_pressure]
        wind_direction   = dsc[key_wind_dir]
        wind_speed       = dsc[key_wind_speed]
        weather_desc     = dsc[key_description]
        code             = dsc[key_code]
    }

    XmlListModel {
        id: hidmetRssFeedId

        source: "http://www.hidmet.gov.rs/ciril/osmotreni/index.rss"
        //query: "/rss/channel/item[title[text()='Станица: Београд']]"
        query: "/rss/channel/item[title[substring-after(text(), ': ') = 'Београд']]"

        XmlRole { name: "title";        query: "title/string()" }
        XmlRole { name: "description";  query: "description/string()" }

        onStatusChanged: {
            var pre = "XmlListModel."
            if (status === XmlListModel.Ready)   {
                if (!reloadTimerId.running) {
                    reloadTimerId.start()
                }

                parse_description(get(0).description)
                station = get(0).title.split(': ')[1] // get just station name
                print(pre +"Ready -count:", count)
            }
            if (status === XmlListModel.Loading) print(pre+"Loading...");
            if (status === XmlListModel.Error)   print(pre+"Error: ", errorString() );
            if (status === XmlListModel.Null)    prin (pre+"Null");
        }
    }

    Timer {
        id: reloadTimerId
        interval: 1000/*ms*/ * 60/*s*/ * refresh_interval_minutes
        repeat: true
        onTriggered: {
            hidmetRssFeedId.reload()
            console.log("reloaded...")
        }
    }

    Plasmoid.fullRepresentation: FullRepresentation {}
    Plasmoid.compactRepresentation: CompactRepresentation {}

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
}
