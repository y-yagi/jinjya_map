class GoogleMap {
  constructor() {
    this.styles = [
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
    this.styledMap = new google.maps.StyledMapType(this.styles, {name: "Styled Map"})

    this.mapOptions = {
      zoom: 15,
      center: { lat: 35.681382, lng: 139.766084 },
      mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
      }
    }

    this.map = new google.maps.Map(document.getElementById('map-canvas'), this.mapOptions)
    this.map.mapTypes.set('map_style', this.styledMap)
    this.map.setMapTypeId('map_style')
  }

  setCenter(lat, lng) {
    this.map.setCenter({lat: lat, lng: lng})
    new google.maps.Marker({position: {lat: lat, lng: lng}, map: this.map})
  }
}
