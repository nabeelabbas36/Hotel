class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :restaurant_id
      t.string :title
      t.string :review_box
      t.string :user_id

      t.timestamps
    end
  end
end
