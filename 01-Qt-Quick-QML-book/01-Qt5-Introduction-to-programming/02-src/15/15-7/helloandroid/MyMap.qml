import QtQuick 2.12
import QtQuick.Controls 2.12
import QtLocation 5.11
import QtPositioning 5.11

Item {
    Plugin {
        id: esri
        name: "esri"
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: esri
        activeMapType: map.supportedMapTypes[1]
        zoomLevel: (maximumZoomLevel - minimumZoomLevel)/2
        center {
            latitude: 39.906
            longitude: 116.3912
        }
        gesture.enabled: true
    }

    GeocodeModel {
        id: geocodeModel
        plugin: esri
        autoUpdate: false

        onLocationsChanged: {
            map.center = geocodeModel.get(0).coordinate
            var latitude = Math.round(geocodeModel.get(0)
                                      .coordinate.latitude * 10000) / 10000
            var longitude = Math.round(geocodeModel.get(0)
                                      .coordinate.longitude * 10000) / 10000
            console.debug(latitude,longitude)
        }
    }

    Button {
        width: 100
        height: 50
        text: qsTr("移动")
        anchors.right: parent.right
        z: 100

        onClicked: {
            geocodeModel.query = "上海,中国"
            geocodeModel.update()
        }
    }
}
