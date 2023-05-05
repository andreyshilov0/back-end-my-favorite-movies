require 'faraday'
require 'json'

# https://api.themoviedb.org/3/genre/movie/list?api_key=<<api_key>>&language=en-US
instance_url = 'https://api.themoviedb.org/3/genre/movie'
api_key = 'b99fe320109a94711294442871bc1553'

response = Faraday.get(instance_url, {max_result: 10}, {"Authorization" => "Bearer #{api_key}"})

data = response.body

# data = JSON.parse(response.body)
puts data

# genres = data['name'].map {|t| t['name'] }
# puts genres