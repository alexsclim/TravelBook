  $(document).ready(() => {
    $('#add-location-geocode').geocomplete({details: 'form', detailsAttribute: 'fill'});
    $('button.search').click(() => {
      $('input').trigger('geocode');
    });
  })
