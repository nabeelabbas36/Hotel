# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
(0..10).each do |a|
  
  user = User.new
  user.email = "user#{a}@gmail.com"
  user.password = user.password_confirmation = "12345678"
  user.save
end
 
admin = Admin.new
admin.email = "admin@gmail.com"
admin.password = admin.password_confirmation = "12345678"
admin.save


# to seed database with countries 
#execute "LOAD DATA INFILE '#{::Rails.root.join('db','migrate','GeoWorldMap', 'Countries.txt')} INTO TABLE countries FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"
# to seed database with states
#execute "LOAD DATA INFILE '#{RAILS_ROOT}/db/migrate/GeoWorldMap/Regions.txt' INTO TABLE regions
      # FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"
# to seed database with cities
execute "LOAD DATA INFILE '#{RAILS_ROOT}/db/migrate/GeoWorldMap/Cities.txt' INTO TABLE cities
       FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"

