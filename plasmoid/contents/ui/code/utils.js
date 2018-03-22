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

var station_map = {
    0 : "Београд"       ,
    1 : "Б. Карловац"   ,
    2 : "Ваљево"        ,
    3 : "В. Градиште"   ,
    4 : "Врање"         ,
    5 : "Димитровград"  ,
    6 : "Зајечар"       ,
    7 : "Златибор"      ,
    8 : "Зрењанин"      ,
    9 : "Кикинда"       ,
    10: "Копаоник"      ,
    11: "Крушевац"      ,
    12: "Крагујевац"    ,
    13: "Краљево"       ,
    14: "Куршумлија"    ,
    15: "Лесковац"      ,
    16: "Лозница"       ,
    17: "Неготин"       ,
    18: "Ниш"           ,
    19: "Нови Сад"      ,
    20: "Палић"         ,
    21: "Пожега"        ,
    22: "С. Паланка"    ,
    23: "Сомбор"        ,
    24: "С. Митровица"  ,
    25: "Ћуприја"       ,
    26: "Црни Врх"
}

function station_enum_to_string(eStation)
{
    return station_map[eStation]
}
