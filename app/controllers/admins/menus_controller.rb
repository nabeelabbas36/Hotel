class Admins::MenusController < ApplicationController
  layout "admin"
  def index
    @menus = Menu.all
    
  end
  def new
    @menu = Menu.new
  end
  def create
    @menu = Menu.new(secure_params)
    
    if @menu.save
      flash[:notice] = "Message sent from #{@menu.name}."
      redirect_to  admins_menus_path
    else
      render :new
    end
  end
  private
  def secure_params
    params.require(:menu).permit(:name, :price, :outlet)
  end
end
