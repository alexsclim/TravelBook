class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = current_user.locations
    @geojson_locations = GeoJSONService.new(@locations).call
    render json: @geojson_locations
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

  def delete
  end

  private
  def location_params
    params.require(:location).permit(:address, :longitude, :latitude, :description, :visited_at)
  end
end
