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

import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    property string cfg_station: "Београд"

    GridLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        columns: 1

        Label {
            text: i18n("Станица")
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        }

        ComboBox {
            id: stationComboBoxId
            Layout.row: 0
            Layout.column: 1

            model: ListModel {
                ListElement { name: "Београд" }
                ListElement { name: "Б. Карловац" }
                ListElement { name: "Ваљево" }
                ListElement { name: "В. Градиште" }
                ListElement { name: "Врање" }
                ListElement { name: "Димитровград" }
                ListElement { name: "Зајечар" }
                ListElement { name: "Златибор" }
                ListElement { name: "Зрењанин" }
                ListElement { name: "Кикинда" }
                ListElement { name: "Копаоник" }
                ListElement { name: "Крушевац" }
                ListElement { name: "Крагујевац" }
                ListElement { name: "Краљево" }
                ListElement { name: "Куршумлија" }
                ListElement { name: "Лесковац" }
                ListElement { name: "Лозница" }
                ListElement { name: "Неготин" }
                ListElement { name: "Ниш" }
                ListElement { name: "Нови Сад" }
                ListElement { name: "Палић" }
                ListElement { name: "Пожега" }
                ListElement { name: "С. Паланка" }
                ListElement { name: "Сомбор" }
                ListElement { name: "С. Митровица" }
                ListElement { name: "Ћуприја" }
                ListElement { name: "Црни Врх" }
            }
//            textRole: "display"

            onCurrentIndexChanged: {
                cfg_station = currentText
                console.log(cfg_station)
            }
        }
    }

    Component.onCompleted: {
        console.log("oncompleted")
    }
}
