class RestaurantsController < ApplicationController
  def create
    restaurant = Restaurant.create(name: params[:name])
    redirect_to root_path
  end

  def index
    @restaurants = Restaurant.joins(:ratings).select("name, avg(rating) as average_rating").group("restaurants.id").order("average_rating DESC")
  end
end
