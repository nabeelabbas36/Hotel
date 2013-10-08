
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


Country.destroy_all
File.open(Rails.root.join('db','migrate','GeoWorldMap', 'Countries.txt'), "r").each do |line|
  country_from_file = line.split(",") 
  unless (country_from_file[1].gsub /"/, '') == "Country"
    Country.create! do |country|
      country.id = country_from_file[0].to_i
      country.name= country_from_file[1].gsub /"/, ''
    end
  end
end

City.destroy_all
File.open(Rails.root.join('db','migrate','GeoWorldMap', 'cities.txt'), "r:ISO-8859-1").each do |line|
  city_from_file =  line.split(",")
  unless (city_from_file[3].gsub /"/, '') == "City"
    City.create! do |city|
      city.id=city_from_file[0].to_i
      city.country_id=city_from_file[1].to_i
      city.region_id=city_from_file[2].to_i
      city.name=city_from_file[3].gsub /"/, ''
    end
  end
end

Region.destroy_all
File.open(Rails.root.join('db','migrate','GeoWorldMap', 'Regions.txt'), "r:ISO-8859-1").each do |line|
  region_from_file =  line.split(",")
  unless (region_from_file[2].gsub /"/, '') == "Region"
    Region.create! do |region|
      region.id=region_from_file[0].to_i
      region.country_id=region_from_file[1].to_i
      region.name=region_from_file[2].gsub /"/, ''
    end
  end
end

