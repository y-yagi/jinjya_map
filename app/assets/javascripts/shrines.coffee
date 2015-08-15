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

