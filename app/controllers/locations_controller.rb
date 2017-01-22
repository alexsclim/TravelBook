class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = current_user.locations
    @geojson = Array.new

    @locations.each do |location|
      @geojson << {
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
    render json: @geojson
  end

  def new
    @location = Location.new
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      flash[:success] = "Location created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def location_params
    params.require(:location).permit(:address, :longitude, :latitude, :visited_at)
  end
end
