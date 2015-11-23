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
  @map = new GoogleMap unless @map
  setCameraLink(@map)
)

$(document).on('page:partial-load', (event) ->
  setCameraLink(@map)
)
