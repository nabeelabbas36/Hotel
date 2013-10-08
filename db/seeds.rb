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
#execute "LOAD DATA INFILE '#{Rails.root}/db/migrate/GeoWorldMap/Regions.txt' INTO TABLE regions
# FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"
# to seed database with cities
#execute "LOAD DATA INFILE '#{RAILS_ROOT}/db/migrate/GeoWorldMap/Cities.txt' INTO TABLE cities
# FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"
Country.destroy_all
File.open(Rails.root.join('db','migrate','GeoWorldMap', 'Countries.txt'), "r").each do |line|
   country_from_file = line.split(",") 
   Country.create! do |country|
    country.id = country_from_file[0].to_i
    country.name= country_from_file[1].to_s
    end
end
#  name, birthdate = line.strip.split("")
#  user = User.new(user_name: name, birth_date: birthdate)
#  user.save
#end
#require "csv"
#
#CSV.foreach(Rails.root.join("Countries1.csv"), headers: true) do |row|
#  Country.create! do |country|
#    new_row = row.to_hash
#    puts "sssssssss", new_row.inspect
#    
##    country.id = row[2]
##    country.name = row[1]
#  end
#   put
#end
City.destroy_all
File.open(Rails.root.join('db','migrate','GeoWorldMap', 'cities.txt'), "r:ISO-8859-1").each do |line|
  line.to_s.force_encoding("UTF-8")
  city_from_file =  line.split(",")
  City.create! do |city|
  city.country_id=city_from_file[1].to_i
  city.region_id=city_from_file[2].to_i
  city.name=city_from_file[3].to_s
  end
end
 

Region.destroy_all
File.open(Rails.root.join('db','migrate','GeoWorldMap', 'Regions.txt'), "r:ISO-8859-1").each do |line|
  line.to_s.force_encoding("UTF-8")
  region_from_file =  line.split(",")
  Region.create! do |region|
    region.id=region_from_file[0].to_i
    region.country_id=region_from_file[1].to_i
    region.name=region_from_file[2].to_s
    
  end
end
#CSV.foreach(Rails.root.join("cities.csv"), headers: true) do |row|
# Country.create! do |city|
#  city.id = row[0]
# city.name = row[1]
#nd
#end
