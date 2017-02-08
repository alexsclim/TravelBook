class UsersController < ApplicationController

  def index
     @users = User.search(params[:search], params[:page])
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
    @user  = User.find(params[:id])
    @users = @user.following_paginate(params[:page])
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers_paginate(params[:page])
    render 'show_follow'
  end

end
