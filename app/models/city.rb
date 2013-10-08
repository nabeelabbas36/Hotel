class City < ActiveRecord::Base
  belongs_to :regions
  has_many :locations
end
