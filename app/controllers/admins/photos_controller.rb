class Admins::PhotosController < ApplicationController
  layout "admin"
  def index
    @photos = Photo.all
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.create(secure_params )
    if @photo.save
      flash[:notice] = "Message sent from #{@photo.avatar}."
      redirect_to admins_photos_path 
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:photo).permit(:avatar)
  end
end