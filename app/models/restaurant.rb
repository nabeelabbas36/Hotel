class Restaurant < ActiveRecord::Base
     has_many :locations
     has_many :reviews
     has_many :sharing_statistics
     has_one :social_info
     has_many :photos
     has_one :photo
end
