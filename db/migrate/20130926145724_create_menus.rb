class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      #      t.integer :restaurant_id
      t.belongs_to :restaurant
      t.string  :name
      t.integer :price
      t.string :outlet

      t.timestamps
    end
  end
end
