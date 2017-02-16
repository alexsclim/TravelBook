$(document).ready(()=> {
  L.mapbox.accessToken = "pk.eyJ1IjoiYWxleHNjbGltIiwiYSI6ImNpc285OWc1cTA2MTAzMG14amI4MHF5aDYifQ.aBzJCCizYqDs0XmnnCGiFw"
  const tripMap = L.mapbox.map('trip-map', 'mapbox.streets').setView([45.1510532655634, -25.398193359375], 1.5).addControl(L.mapbox.geocoderControl('mapbox.places', {
        autocomplete: true
  }));;

  const markers = new L.MarkerClusterGroup();
  const userId = $('#get-user').data('user-id');
  const tripId = $('#get-trip').data('trip-id');

  $.ajax({
    type: "GET",
    url: `/users/${userId}/trips/${tripId}`,
    dataType: "json",
    success: (data) => {
      const geoJsonLayer = L.geoJson(data, {
        onEachFeature: (feature, layer) => {
          if (feature.properties.image_url != "/images/thumb/missing.png") {
            layer.bindPopup(`<b><div class="text-center">${feature.properties.title}</div></b>
                           </br>
                           <div class="text-center">${feature.properties.description}</div>
                           <div class="text-center">
                           <img class="container-image" src="${feature.properties.image_url}"></div>
                           </div>
                           </br>
                           <div>Start Date: ${feature.properties.start_date}</div>
                           <div>End Date: ${feature.properties.end_date}</div>`);
          } else {
            layer.bindPopup(`<b><div class="text-center">${feature.properties.title}</div></b>
                           </br>
                           <div class="text-center">${feature.properties.description}</div>
                           </br>
                           <div>Start Date: ${feature.properties.start_date}</div>
                           <div>End Date: ${feature.properties.end_date}</div>`);
          }
        }
      });
      markers.addLayer(geoJsonLayer);
      const polyline = L.polyline([]).addTo(tripMap);
      markers.eachLayer((l) => {
        polyline.addLatLng(l.getLatLng());
      });
      tripMap.addLayer(markers);
      tripMap.fitBounds(markers.getBounds());
    }
  });
});
