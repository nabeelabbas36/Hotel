class CreateSharingStatistics < ActiveRecord::Migration
  def change
    create_table :sharing_statistics do |t|
      t.integer :restaurant_id
      t.string :user_id
      t.string :media

      t.timestamps
    end
  end
end
