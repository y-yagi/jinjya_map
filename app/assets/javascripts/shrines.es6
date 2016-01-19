(() => {
  var Cookies = require('js-cookie');
  let map;
  const setCameraLink = (map) => {
    $('.move-camera').click(event => {
      let lat = $(event.target).data('shrine-lat')
      let lng = $(event.target).data('shrine-lng')
      map.setCenter(lat, lng)
      setBrowsingHistory($(event.target).data('shrine-id'))
    })
  }

  const setBrowsingHistory = (shrine_id) => {
    let shrine_ids = Cookies.get('shrine_history')
    if(_.isEmpty(shrine_ids))
      shrine_ids = shrine_id
    else
      shrine_ids = shrine_id + ',' + shrine_ids

    Cookies.set('shrine_history', shrine_ids)
  }


  $(document).on('ready', (event) => {
    if (!map)
      map = new GoogleMap
    setCameraLink(map)
  })

  $(document).on('page:partial-load', (event) => {
    setCameraLink(map)
  })
}).call(this)
