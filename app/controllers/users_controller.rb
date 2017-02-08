class UsersController < ApplicationController

  def index
    @users = User.all.order(:first_name)
  end

  def show
    @user = User.find(params[:id])
    @locations = @user.locations
    @geojson_locations = GeoJSONService.new(@locations).call
    respond_to do |format|
      format.html { render 'show' }
      format.js { render json: @geojson_locations }
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.order(:first_name)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.order(:first_name)
    render 'show_follow'
  end

end
