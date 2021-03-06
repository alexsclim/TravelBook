class GeoJSONService
  attr_reader :locations

  def initialize(locations)
    @locations = locations
  end

  def call
    geojson_locations = Array.new

    @locations.each do |location|

      images = []
      location.pictures.each do |picture|
        images << picture.image.url(:square)
      end

      geojson_locations << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [location.longitude, location.latitude]
        },
        properties: {
          address: location.address,
          'title': location.address,
          'start_date': location.start_date,
          'end_date': location.end_date,
          'description': location.description,
          'marker-size': 'large',
          'marker-color': 'ff1a1a',
          'marker-symbol': 'rocket',
          'images': images
        }
      }
    end
    geojson_locations
  end

end
