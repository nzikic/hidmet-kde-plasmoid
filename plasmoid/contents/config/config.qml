import QtQuick 2.1

import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
        name: i18n("Станица")
        icon: "services"
        source: "config/ConfigWeatherStation.qml"
    }
}
