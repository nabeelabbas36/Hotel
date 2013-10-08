class Admins::RegionsController < ApplicationController
 layout "admin"
  def index
    @regions = Country.all
    
  end
  def new
    @region = Country.new
  end
  def create 
    @region = Location.new(secure_params)
    
    if @region.save
      flash[:notice] = "Message sent from #{@region.name}."
      redirect_to  admins_countries_path
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:region).permit(:name)
  end
end
