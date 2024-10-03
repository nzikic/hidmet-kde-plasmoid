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
import QtQuick.Controls as QQC2

import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM

import '../../tools/hidmetUtils.js' as Hidmet


KCM.SimpleKCM {
    property alias cfg_stationId: cbStation.currentValue
    property alias cfg_reloadIntervalMinutes: sbReloadInterval.value
    property alias cfg_compactViewMode: cbCompactView.currentIndex

    Kirigami.FormLayout {

        Item {
            Kirigami.FormData.isSection: true
        }

        QQC2.ComboBox {
            id: cbStation

            valueRole: "id"
            textRole: "name"
            model: Hidmet.modelStations

            Kirigami.FormData.label: i18n("Станица:")
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        QQC2.SpinBox {
            id: sbReloadInterval

            from: 5
            to: 120
            stepSize: 5

            Kirigami.FormData.label: i18n("Интервал освежавања:")
        }

        Item {
            Kirigami.FormData.isSection: true
        }

        QQC2.ComboBox {
            id: cbCompactView

            model: Hidmet.configCompactViewModel

            Kirigami.FormData.label: i18n("Приказ иконице:")
        }
    }
}
