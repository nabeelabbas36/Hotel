class Photo < ActiveRecord::Base
  belongs_to :restaurant
  # when you are using paperclip you have to define has_attached_file in the model and name of file
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
