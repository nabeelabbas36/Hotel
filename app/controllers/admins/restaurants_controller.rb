class Admins::RestaurantsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show,:index]
  layout "admin"
  
  def index
    @restaurants = Restaurant.all
    
  end
  def new
    @restaurant = Restaurant.new
  end
  def create
    
    @restaurant = Restaurant.new(secure_params)
    
    if @restaurant.save
      flash[:notice] = "Message sent from #{@restaurant.name}."
      redirect_to admins_restaurants_path 
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:restaurant).permit(:name, :location, :start_time, :close_time)
  end
end
