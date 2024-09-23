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

const _logfunc = (level, message) => print(`${Date().toString("YYYY-MM-DDTHH:mm:ss:sssZ")} [${level}] ${message}`);

const error = (message) => _logfunc("ERROR", message);
const warn = (message) => _logfunc("WARN", message);
const info = (message) => _logfunc("INFO", message);
const debug = (message) => _logfunc("DEBUG", message);


