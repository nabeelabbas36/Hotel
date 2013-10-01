class CreateSocialInfos < ActiveRecord::Migration
  def change
    create_table :social_infos do |t|
      t.integer :restaurant_id
      t.string :facebook
      t.string :twitter
      t.string :tumblr
      t.string :linkedin

      t.timestamps
    end
  end
end
