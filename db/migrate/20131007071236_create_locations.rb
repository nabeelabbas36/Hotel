class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :restaurant_id
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps
      t.time :start_time
      t.time :close_time
      t.integer :city_id
      
      t.timestamps
    end
  end
end
