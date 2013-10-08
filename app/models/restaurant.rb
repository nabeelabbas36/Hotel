class Restaurant < ActiveRecord::Base
     has_many :locations
     has_many :reviews
     has_many :menus
     has_many :sharing_statistics
     has_many :social_info
     has_many :photo
     
   
     
  # as restaurant is main model and we want to join many models with it through nested forms so we have to define accepts_nested_attributes_for in restaurant model 
     accepts_nested_attributes_for :locations
     accepts_nested_attributes_for :menus
     accepts_nested_attributes_for :photo
     accepts_nested_attributes_for :social_info
     
     #accepts_nested_attributes_for :menu
     #accepts_nested_attributes_for :social_info
     #accepts_nested_attributes_for :city
    # accepts_nested_attributes_for :country
      
end
