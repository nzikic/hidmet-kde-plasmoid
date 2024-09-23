cmake_minimum_required(VERSION 3.20.0)

project(hidmet-kde-plasmoid)

# Use Extra CMake Modules (ECM) for common functionality.
# See http://api.kde.org/ecm/manual/ecm.7.html
# and http://api.kde.org/ecm/manual/ecm-kde-modules.7.html
find_package(ECM REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_MODULE_PATH})

find_package(Plasma REQUIRED)

find_package(Qt6 CONFIG REQUIRED
    Quick
    Qml
)

plasma_install_package(package com.github.nzikic.hidmet-kde-plasmoid)
