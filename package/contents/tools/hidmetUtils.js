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

const stations = {
    "13067": "Палић",
    "13160": "Сомбор",
    "13168": "Нови Сад",
    "13173": "Зрењанин",
    "13174": "Кикинда",
    "13180": "Б. Карловац",
    "13262": "Лозница",
    "13266": "С. Митровица",
    "13269": "Ваљево",
    "13274": "Београд",
    "13278": "Крагујевац",
    "13279": "С. Паланка",
    "13285": "В. Градиште",
    "13289": "Црни Врх",
    "13295": "Неготин",
    "13367": "Златибор",
    "13369": "Сјеница",
    "13370": "Пожега",
    "13376": "Краљево",
    "13378": "Копаоник",
    "13382": "Куршумлија",
    "13383": "Крушевац",
    "13384": "Ћуприја",
    "13388": "Ниш",
    "13389": "Лесковац",
    "13392": "Зајечар",
    "13397": "Димитровград",
    "13489": "Врање",
};

const modelStations = (function() {
    let model = [];
    Object.entries(stations).forEach(([id, name]) =>
        model.push({ id: id, name: name }));
    return model;
})();

function newEmptyStationData() {
    return {
        id: "",
        temperature: "",
        preassure: "",
        windDirection: "",
        windSpeed: "",
        humidity: "",
        description: "",
        descriptionCode: "0"
    };
}

function transformKeys_CyrToEng(data) {
    if (!data)
        return newEmptyStationData();

    let eng = {};
    eng.id = data["ИД станице"] ?? "";
    eng.temperature = data["Температура"] ?? "";
    eng.preassure = data["Притисак"] ?? "";
    eng.windDirection = data["Правац ветра"] ?? "";
    eng.windSpeed = data["Брзина ветра"] ?? "";
    eng.humidity = data["Влажност"] ?? "";
    eng.description = data["Опис времена"] ?? "";
    eng.descriptionCode = data["Шифра описа времена"] ?? "";

    return eng;
}

function parseStationSummary(summary) {
    if (!summary)
        return undefined;

    let items = summary.split(';').filter(item => item.includes(': '));

    let dict = items.map(item => {
        let [prop, value] = item.split(': ').map(s => s.trim());
        return [ prop, value ];
    });

    let reduced = {};
    for (let [ prop, value ] of dict) {
        reduced[prop] = value;
    }

    return reduced;
};

function getIconUrl(code) {
    return `https://www.hidmet.gov.rs/repository/ikonice/osmotreni/${code ? code : "0"}.png`;
}
