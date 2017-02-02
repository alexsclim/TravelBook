class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @user = User.find(params[:user_id])
    @trips = @user.trips
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      flash[:notice] = "Trip created!"
      redirect_to user_trips_path
    else
      render 'new'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @locations = @trip.locations
    @geojson_locations = GeoJSONService.new(@locations).call
    respond_to do |format|
      format.html { render 'show' }
      format.js { render json: @geojson_locations }
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    flash[:notice] = "Location deleted"
    redirect_to user_trips_path
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :summary)
  end
end
