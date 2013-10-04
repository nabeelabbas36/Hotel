class Admins::RestaurantsController < ApplicationController
  before_filter :authenticate_admin!, :except => [:show,:index]
  layout "admin"
  
  def index
    @restaurants = Restaurant.all
    
  end
  def new
    @restaurant = Restaurant.new
    # for nested forms we have to use .build
    1.times do
      @restaurant.menus.build
      @restaurant.photo.build
      @restaurant.social_info.build
      
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
 #the forms which we defined in restaurants we have to permit values so they can be saved in database we have to permit them as shown below
  private
  def secure_params
    params.require(:restaurant).permit(:name, menus_attributes: [:id, :name, :price, :outlet], photo_attributes: [:id, :avatar], social_info_attributes: [:id, :facebook, :twitter, :tumblr] )
    
  end
end
