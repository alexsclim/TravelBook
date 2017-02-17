$(document).ready(()=> {
  L.mapbox.accessToken = "pk.eyJ1IjoiYWxleHNjbGltIiwiYSI6ImNpc285OWc1cTA2MTAzMG14amI4MHF5aDYifQ.aBzJCCizYqDs0XmnnCGiFw"
  const map = L.mapbox.map('users-map', 'mapbox.streets').setView([45.1510532655634, -25.398193359375], 1.5).addControl(L.mapbox.geocoderControl('mapbox.places', {
        autocomplete: true
    }));;

  const markers = new L.MarkerClusterGroup();
  const userId = $('#get-user').data('user-id');

  $.ajaxSetup({
    cache: false
  });

  $.ajax({
    type: "GET",
    url: `/users/${userId}`,
    cache: false,
    dataType: "json",
    success: (data) => {
      const geoJsonLayer = L.geoJson(data, {
        onEachFeature: (feature, layer) => {

          const images = feature.properties.images;
          let slideshowContent = '';
          for (let i = 0; i < images.length; i++) {
            let img = images[i];

            slideshowContent += `<div class="image ${(i === 0 ? ' active' : '')} ">
                                  <img src="${img}" />
                                  </div>`;
          }

          if (slideshowContent.length > 0) {
            layer.bindPopup(`<div class="popup">
                              <b><div class="text-center">${feature.properties.title}</div></b>
                              </br>
                              <div class="text-center">
                              <div class="slideshow">${slideshowContent}</div>
                              </div>
                              <div class="cycle">
                              <a href="#" class="prev">&laquo; Previous</a>
                              <a href="#" class="next">Next &raquo;</a>
                              </div>
                              </br>
                              <div class="text-center">${feature.properties.description}</div>
                              </br>
                              <div>Start Date: ${feature.properties.start_date}</div>
                              <div>End Date: ${feature.properties.end_date}</div>
                              </div>`);
          } else {
            layer.bindPopup(`<div class="popup">
                              <b><div class="text-center">${feature.properties.title}</div></b>
                              </br>
                              <div class="text-center">${feature.properties.description}</div>
                              </br>
                              <div>Start Date: ${feature.properties.start_date}</div>
                              <div>End Date: ${feature.properties.end_date}</div>
                              </div>`);
          }
        }
      });
      markers.addLayer(geoJsonLayer);
      map.addLayer(markers);
      map.fitBounds(markers.getBounds());
    }
  });

  $('#users-map').on('click', '.popup .cycle a', () => {
      let $slideshow = $('.slideshow'),
          $newSlide;

      if ($(this).hasClass('prev')) {
          $newSlide = $slideshow.find('.active').prev();
          if ($newSlide.index() < 0) {
              $newSlide = $('.image').last();
          }
      } else {
          $newSlide = $slideshow.find('.active').next();
          if ($newSlide.index() < 0) {
              $newSlide = $('.image').first();
          }
      }

      $slideshow.find('.active').removeClass('active').hide();
      $newSlide.addClass('active').show();
      return false;
  });
});
