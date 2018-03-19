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
