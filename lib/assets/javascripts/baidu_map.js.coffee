window.baiduMapInstance =
  init: (exts) ->
    $.extend(this, exts)
    this

  loadMapScript: ->
    $.ajax
      url: "http://api.map.baidu.com/api?v=2.0&ak=#{@token}"
      dataType: "jsonp"
      jsonp: "callback"
      jsonpCallback: "baiduMapInstance.build"

  build: ->
    myGeo = new BMap.Geocoder
    myGeo.getPoint(@address, $.proxy(@buildMapElement, this), @city)

  buildMapElement: (point) ->
    return unless point
    map = new BMap.Map(@wrapperElementId)
    map.centerAndZoom point, 18

    mapControl = new BMap.NavigationControl
      anchor: BMAP_ANCHOR_TOP_RIGHT
      type: BMAP_NAVIGATION_CONTROL_SMALL
    map.addControl(mapControl)

    marker = new BMap.Marker(point)
    map.addOverlay(marker)
    infoWindow = new BMap.InfoWindow @address,
      width: 250
      height: 50
      title: @name
      enableMessage: false
    marker.addEventListener "click", ->
      map.openInfoWindow(infoWindow, point)