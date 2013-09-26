class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :city_id
      t.string :area
      t.string :address
      t.time :start_time
      t.time :close_time
      t.boolean :delievery

      t.timestamps
    end
  end
end
