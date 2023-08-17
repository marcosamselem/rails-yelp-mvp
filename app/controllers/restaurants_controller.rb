class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = restaurant
    @restaurant.save
    redirect_to restaurant_path(@restaurant)

  end

  def show
  end

  private



  def review_params
    params.require(:review).permit(:content)
  end
end
