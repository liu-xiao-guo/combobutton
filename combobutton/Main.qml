import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.3

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "combobutton.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true


    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("combobutton")

        Column {
            anchors.fill: parent
            spacing: units.gu(2)

            ComboButton {
                text: "smaller content"
                Rectangle {
                    height: units.gu(5) // smaller than the default expandedHeight
                    color: "blue"
                }
            }

            ComboButton {
                id: combo
                text: "long scrolled content"

                ListView {
                    model: 10
                    delegate: Standard {
                        text: "Item #" + modelData

                        onClicked: {
                            console.log("item: " + index + " clicked")
                            combo.expanded = false;
                        }

                    }
                }
            }
        }
    }
}

