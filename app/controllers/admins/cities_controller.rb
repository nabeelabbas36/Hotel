class Admins::CitiesController < ApplicationController
  layout "admin"
  def index
    @cities = City.all
    
  end
  def new
    @city = City.new
  end
  def create 
    
    @city = City.new(secure_params)
    
    if @city.save
      flash[:notice] = "Message sent from #{@city.name}."
      redirect_to  admins_cities_path
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:city).permit(:name)
  end
end
