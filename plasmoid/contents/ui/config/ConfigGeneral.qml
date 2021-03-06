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
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

Item {

    property alias  cfg_station: stationComboBoxId.currentIndex
    property alias  cfg_reloadIntervalMinutes: reloadIntervalMinutes.value
    property int    cfg_compactLayout

    ExclusiveGroup {
        id: compactLayoutExGrp
    }

    onCfg_compactLayoutChanged: {
        switch (cfg_compactLayout) {
            case 0:
                compactLayoutExGrp.current = compactLayoutIcon
                break;
            case 1:
                compactLayoutExGrp.current = compactLayoutTemperature
                break;
            default:
                break;
        }
    }

    GridLayout {
        anchors.left: parent.left
        columns: 2

        Label {
            text: i18n("Станица:")
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        }

        ComboBox {
            id: stationComboBoxId

            model: ListModel {
                ListElement { name: "Београд"       }
                ListElement { name: "Б. Карловац"   }
                ListElement { name: "Ваљево"        }
                ListElement { name: "В. Градиште"   }
                ListElement { name: "Врање"         }
                ListElement { name: "Димитровград"  }
                ListElement { name: "Зајечар"       }
                ListElement { name: "Златибор"      }
                ListElement { name: "Зрењанин"      }
                ListElement { name: "Кикинда"       }
                ListElement { name: "Копаоник"      }
                ListElement { name: "Крушевац"      }
                ListElement { name: "Крагујевац"    }
                ListElement { name: "Краљево"       }
                ListElement { name: "Куршумлија"    }
                ListElement { name: "Лесковац"      }
                ListElement { name: "Лозница"       }
                ListElement { name: "Неготин"       }
                ListElement { name: "Ниш"           }
                ListElement { name: "Нови Сад"      }
                ListElement { name: "Палић"         }
                ListElement { name: "Пожега"        }
                ListElement { name: "С. Паланка"    }
                ListElement { name: "Сомбор"        }
                ListElement { name: "С. Митровица"  }
                ListElement { name: "Ћуприја"       }
                ListElement { name: "Црни Врх"      }
            }
        }

        Label {
            text: i18n("Интервал освежавања:")
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        }

        SpinBox {
            id: reloadIntervalMinutes
            decimals: 0
            stepSize: 5
            minimumValue: 5
            maximumValue: 120
            suffix: i18n(' минута')
        }

        Label {
            text: i18n("Компактан приказ:")
            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        }

        RadioButton {
            id: compactLayoutIcon
            text: i18n("Иконица")
            exclusiveGroup: compactLayoutExGrp
            onCheckedChanged: if (checked) cfg_compactLayout = 0
        }

        Item {
            // just to fill empty cell
            width: 2
            height: 2
        }

        RadioButton {
            id: compactLayoutTemperature
            text: i18n("Температура")
            exclusiveGroup: compactLayoutExGrp
            onCheckedChanged: if (checked) cfg_compactLayout = 1
        }
    }

    Component.onCompleted: {
        cfg_compactLayoutChanged()
    }
}
