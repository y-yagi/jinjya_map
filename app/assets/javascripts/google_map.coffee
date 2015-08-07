
class GoogleMap
  attachMessage = (marker, msg) ->
    google.maps.event.addListener(marker, 'click', (event) ->
      new google.maps.InfoWindow({content: msg}
      ).open(marker.getMap(), marker)
    )

  show: (zoom) ->
    styles = [
      {
        stylers: [
          { hue: "#f44336" },
          { saturation: -20 }
        ]
      },{
        featureType: "road",
        elementType: "geometry",
        stylers: [
          { lightness: 100 },
          { visibility: "simplified" }
        ]
      },{
        featureType: "road",
        elementType: "labels",
        stylers: [
          { visibility: "off" }
        ]
      }
    ]
    styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"})

    mapOptions =
      zoom: 15
      center: { lat: 35.681382, lng: 139.766084 },
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
      }

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)
    map.mapTypes.set('map_style', styledMap)
    map.setMapTypeId('map_style')

$ ->
  new GoogleMap().show(8)
