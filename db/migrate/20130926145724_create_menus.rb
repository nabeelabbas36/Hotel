class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :restaurantid
      t.string  :name
      t.integer :price
      t.string :outlet

      t.timestamps
    end
  end
end
