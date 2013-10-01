class Admins::LocationsController < ApplicationController
  layout "admin"
  def index
    @locations = Location.all
    
  end
  def new
    @location = Location.new
    @location.restaurant.build
  end
  def create 
    @location = Location.new(secure_params)
    
    if @location.save
      flash[:notice] = "Message sent from #{@location.name}."
      redirect_to  admins_locations_path
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:location).permit(:area, :address, :start_time,:close_time)
  end
end
