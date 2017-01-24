class GeoJSONService
  attr_reader :locations

  def initialize(locations)
    @locations = locations
  end

  def call
    geojson_locations = Array.new

    @locations.each do |location|
      geojson_locations << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [location.longitude, location.latitude]
        },
        properties: {
          address: location.address,
        }
      }
    end
    geojson_locations
  end

end
