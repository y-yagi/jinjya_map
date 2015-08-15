class GoogleMap
  constructor: ->
    styles = [
      {
        stylers: [
          { hue: "#4CAF50" },
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

    @map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)
    @map.mapTypes.set('map_style', styledMap)
    @map.setMapTypeId('map_style')

  setCenter: (lat, lng) ->
    @map.setCenter({lat: lat, lng: lng})
    new google.maps.Marker({position: {lat: lat, lng: lng}, map: @map})

$(document).on('ready', (event) ->
  mMap = new GoogleMap unless mMap
  setCameraLink(mMap)
)

$(document).on('page:partial-load', (event) ->

  mMap = new GoogleMap unless mMap
  lat = $('#shrines').find('a').data('shrine-lat')
  lng = $('#shrines').find('a').data('shrine-lng')
  mMap.setCenter(lat, lng)

  setCameraLink(mMap)
)

setCameraLink = (map) ->
  $('.move-camera').click (e) ->
    lat = $(e.target).data('shrine-lat')
    lng = $(e.target).data('shrine-lng')
    map.setCenter(lat, lng)
    setBrowsingHistory($(e.target).data('shrine-id'))

setBrowsingHistory = (shrine_id) ->
  shrine_ids = Cookies.get('shrine_history')
  if _.isEmpty(shrine_ids)
    shrine_ids = shrine_id
  else
    shrine_ids = shrine_id + ',' + shrine_ids

  Cookies.set('shrine_history', shrine_ids)
