class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = current_user.locations
    @geojson_locations = GeoJSONService.new(@locations).call
    render json: @geojson_locations
  end

  def new
    @location = Location.new
    @trips = Trip.all
  end

  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      if params[:images]
        CreateImageService.new(@location, params[:images]).call
      end
      flash[:notice] = "Location created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      if params[:images]
        CreateImageService.new(@location, params[:images]).call
      end
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Location.find(params[:id]).destroy
    flash[:notice] = "Location deleted"
    redirect_to root_url
  end

  def trip_new
    @location = Location.new
  end

  def trip_create
    @location = current_user.trips.find(params[:trip_id]).locations.build(location_params)
    if @location.save
      if params[:images]
        CreateImageService.new(@location, params[:images]).call
      end
      flash[:notice] = "Location created!"
      redirect_to user_trip_path(current_user.id, params[:trip_id])
    else
      render 'trip_new'
    end
  end

  def trip_edit
    @location = Location.find(params[:id])
  end

  private
  def location_params
    params.require(:location).permit(:address, :longitude, :latitude, :description, :start_date, :end_date, :trip_id, :user_id, :image)
  end
end
