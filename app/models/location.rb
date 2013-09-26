class Location < ActiveRecord::Base
     belongs_to  :restaurant
     belongs_to :city
end
