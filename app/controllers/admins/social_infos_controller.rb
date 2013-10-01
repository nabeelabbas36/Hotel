class Admins::SocialInfosController < ApplicationController
  layout "admin"
  def index
    @social_infos = SocialInfo.all
    
  end
  def new
    @social_info = SocialInfo.new
  end
  def create
    
    @social_info = Social_info.new(secure_params)
    
    if @social_info.save
      flash[:notice] = "Message sent from #{@social_info.name}."
      redirect_to admins_social_info_path 
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:social_info).permit(:facebook, :twitter, :tumblr)
  end
end
