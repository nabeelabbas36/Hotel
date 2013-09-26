class CreateSharingStatistics < ActiveRecord::Migration
  def change
    create_table :sharing_statistics do |t|
      t.integer :restaurantid
      t.string :user_id
      t.string :media

      t.timestamps
    end
  end
end
