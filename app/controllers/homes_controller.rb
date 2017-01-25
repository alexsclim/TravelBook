class HomesController < ApplicationController
  def index
    if user_signed_in?
      render 'index'
    else
      render 'alt_index'
    end
  end
end
