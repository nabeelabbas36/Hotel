json.array!(@locations) do |location|
  json.extract! location, :name, :address, :longitude, :latitude, :gmaps, :start_time, :close_time
  json.url location_url(location, format: :json)
end
