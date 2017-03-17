class RestaurantsController < ApplicationController
  def create
    restaurant = Restaurant.create(name: params[:name])
    redirect_to root_path
  end

  def index
    @restaurants = Restaurant.joins(:ratings).select("restaurants.id, restaurants.name, avg(ratings.rating) as average_rating").group("restaurants.id").order("average_rating DESC")

    # @restaurants = Restaurant.includes(:ratings)
    # @restaurants[0].ratings.avg(:rating)
  end
end
