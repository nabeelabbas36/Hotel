class Admins::RestaurantsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show,:index]
  layout "admin"
  
  def index
    @restaurants = Restaurant.all
    
  end
  def new
    @restaurant = Restaurant.new
    
    1.times do
      @restaurant.menus.build
      @restaurant.photo.build
    end
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
    params.require(:restaurant).permit(:name, menus_attributes: [:id, :name, :price, :outlet], photo_attributes: [:id, :avatar] )
    
  end
end
