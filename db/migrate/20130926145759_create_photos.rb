class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :restaurantid

      t.timestamps
    end
  end
end
