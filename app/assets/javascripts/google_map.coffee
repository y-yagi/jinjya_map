
class GoogleMap
  attachMessage = (marker, msg) ->
    google.maps.event.addListener(marker, 'click', (event) ->
      new google.maps.InfoWindow({content: msg}
      ).open(marker.getMap(), marker)
    )

  show: (zoom) ->
    mapOptions =
      zoom: 15
      center: { lat: 35.681382, lng: 139.766084 },
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)

$ ->
  new GoogleMap().show(8)
