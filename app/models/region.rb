class Region < ActiveRecord::Base
    has_many :cities
    belongs_to :countries
end
