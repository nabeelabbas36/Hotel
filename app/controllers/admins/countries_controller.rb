class Admins::CountriesController < ApplicationController
  layout "admin"
  def index
    @contries = Country.all
    
  end
  def new
    @country = Country.new
  end
  def create 
    @country = Location.new(secure_params)
    
    if @country.save
      flash[:notice] = "Message sent from #{@country.name}."
      redirect_to  admins_countries_path
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:country).permit(:name)
  end
end
