import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.XmlListModel 2.0

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
//import org.kde.plasma.private.weather 1.0


// Item - the most basic plasmoid component, an empty container.
/*Item {

    // IconItem - a simple item to display an icon
    PlasmaCore.IconItem {

        // source - the icon to be displayed
        source: "face-kiss"
//        source: Url { text: "http://www.hidmet.gov.rs/repository/ikonice/osmotreni/22.gif" }

        // height & width set to equal the size of the parent item (the empty "Item" above)
        width: parent.width
        height: parent.width
    }
}
*/

Item {
    id: rootId
    width: plasmoidWidth//fullrepresentationId.implicitWidth
    height: plasmoidHeight//fullrepresentationId.implicitHeight

    property int plasmoidWidth : 150
    property int plasmoidHeight : 170
    
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
        //source: "qrc:///sources/hidmet.xml"
        source: "http://www.hidmet.gov.rs/ciril/osmotreni/index.rss"
        //query: "/rss/channel/item[title[text()='Станица: Београд']]"
        query: "/rss/channel/item[title[substring-after(text(), ': ') = 'Београд']]"
        XmlRole { name: "title";        query: "title/string()" }
        XmlRole { name: "description";  query: "description/string()" }

        onStatusChanged: {
            var pre = "XmlListModel."
            if (status === XmlListModel.Ready)   {
                parse_description(get(0).description)
                station = get(0).title.split(': ')[1]
                print(pre +"Ready -count:", count)
            }
            if (status === XmlListModel.Loading) print(pre+"Loading...");
            if (status === XmlListModel.Error)   print(pre+"Error: ", errorString() );
            if (status === XmlListModel.Null)    prin (pre+"Null");
        }
    }

    Plasmoid.fullRepresentation: FullRepresentation {}
    Plasmoid.compactRepresentation: CompactRepresentation {}


    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
}
