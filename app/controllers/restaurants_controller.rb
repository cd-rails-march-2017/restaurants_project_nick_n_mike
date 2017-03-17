class RestaurantsController < ApplicationController
  def create
  end

  def index
    @restaurants = Restaurant.all
  end
end
