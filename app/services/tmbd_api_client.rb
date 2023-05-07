require 'faraday'
require 'json'
require 'pry'

INSTANCE_URL = 'https://api.themoviedb.org/3/'
API_KEY = 'b99fe320109a94711294442871bc1553'

instance_request = Faraday.new(
    url: INSTANCE_URL,
    params: {api_key: API_KEY, language: 'en-US'},
    headers: {'Content-Type' => 'application/json'}
)
response_genres = instance_request.get('genre/movie/list', {language: 'en-US'}, {"Authorization" => "Bearer #{API_KEY}"})

response_data_movies = instance_request.get('discover/movie', {language: 'en-US', sort_by: 'popularity.desc', page: '1', with_genres: "Action", year: '2005', vote_avarege: '1000' }, {"Authorization" => "Bearer #{API_KEY}"})

response_data_movies_by_id = instance_request.get('movie/550', {language: 'en-US'}, {"Authorization" => "Bearer #{API_KEY}"})

response_total_page_count = instance_request.get('discover/movie', {language: 'en-US'}, {"Authorization" => "Bearer #{API_KEY}"})


begin
    parsed_response = JSON.parse(response_genres&.body || "{}")
    @genres = parsed_response
    @genres = @genres["genres"]
    @genres
    
rescue JSON::ParserError, TypeError => error
    puts error
end

begin
    parsed_response = JSON.parse(response_data_movies&.body || "{}")
    @discover = parsed_response
    @discover
    # year, page, number, genresID, range
rescue JSON::ParserError, TypeError => error
    puts error
end

begin
    parsed_response = JSON.parse(response_data_movies_by_id&.body || "{}")
    @movie_by_id = parsed_response
    @movie_by_id
    #id
rescue JSON::ParserError, TypeError => error
    puts error
end

begin
    parsed_response = JSON.parse(response_total_page_count&.body || "{}")
    @total_page = parsed_response
    @total_page
rescue JSON::ParserError, TypeError => error
    puts error
end
