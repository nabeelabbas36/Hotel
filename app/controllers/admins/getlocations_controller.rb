class Admins::GetlocationsController < ApplicationController

  def get_regions
    @regions = Country.find_by_id(params[:getlocation_id]).regions
    render :partial => "/admins/getlocations/get_regions", :locals => {:regions => @regions}
  end
  def get_cities
    @cities = Region.find_by_id(params[:getlocation_id]).cities
   render :partial => "/admins/getlocations/get_cities", :locals => { :cities => @cities}
  
  end
end
