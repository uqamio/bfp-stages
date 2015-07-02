baseApp = angular.module 'baseApp'

MapController = ($scope, FoundationApi) ->
  domicile = ['2402 rue Vimont, Longueuil, Qc']
  ecoles = [
    'École Adrien-Gamache 2375 LAVALLÉE Longueuil, QC',
    'École Lionel-Groulx 2725 Rue Plessis Longueuil, QC J4L 1S3',
    'École Hubert-Perron 1100 BEAUREGARD Longueuil, QC'
  ]

  geocoder = new google.maps.Geocoder()
  destinationIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=D|FF0000|000000'
  originIcon = 'https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=O|FFFF00|000000'

  bounds = new google.maps.LatLngBounds()
  markersArray = []

  #fonction pour ajouter un marqueur sur la map
  addMarker = (location, isDestination, infowindow)->
    icon = null
    if (isDestination)
      icon = destinationIcon
    else
      icon = originIcon

    geocoder.geocode {'address': location}, (results, status) ->
      if (status == google.maps.GeocoderStatus.OK)
        map = $scope.map.mapControl.getGMap()
        bounds.extend(results[0].geometry.location)
        map.fitBounds(bounds)
        marker = new google.maps.Marker {
          map: map,
          position: results[0].geometry.location,
          icon: icon
        }

        (google.maps.event.addListener marker, 'mouseover', () -> infowindow.open map, marker) if infowindow
        (google.maps.event.addListener marker, 'mouseout', () -> infowindow.close map, marker)if infowindow

        markersArray.push marker
      else
        alert 'Geocode was not successful for the following reason: ' + status


  $scope.ouvrirMap = ()->
    FoundationApi.publish 'advancedModal', 'open'
    $scope.map = {center: {latitude: 45.4960667, longitude: -73.56931529999997}, zoom: 12, mapControl: {}};

    service = new google.maps.DistanceMatrixService();
    service.getDistanceMatrix {
        origins: domicile,
        destinations: ecoles,
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
      },
      (response, status)->
        if (status != google.maps.DistanceMatrixStatus.OK)
          alert('Error was: ' + status);
        else
          origins = response.originAddresses
          destinations = response.destinationAddresses
          #outputDiv = document.getElementById('outputDiv')
          #outputDiv.innerHTML = ''
          #deleteOverlays();

          for origin, i in origins
            results = response.rows[i].elements
            addMarker(origin, false);
            for result, j in results
              #origins[i] + ' to ' + destinations[j] + ': ' + results[j].distance.text + ' in ' + results[j].duration.text
              domicile = origins[i]
              destination = destinations[j]
              distance = results[j].distance.text
              duration = results[j].duration.text
              iw = new google.maps.InfoWindow({
                content: """
                          <p><strong>Distances</strong></p>
                          <p>Domicile : #{domicile}. <br/>
                             Destination : #{destination}.</p>
                          <p>Distance à parcourir : #{distance}, durée : #{duration}.</p>
                        """
              });
              addMarker destinations[j], true, iw

              console.log


MapController.$inject = ['$scope', 'FoundationApi']
baseApp.controller('MapController', MapController)