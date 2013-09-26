class CreateSocialInfos < ActiveRecord::Migration
  def change
    create_table :social_infos do |t|
      t.integer :restaurantid
      t.string :facebook
      t.string :twitter
      t.string :tumblr
      t.string :linkedin

      t.timestamps
    end
  end
end
