require 'faraday'
require 'json'

class GetTmbdApi
  API_KEY = ENV['API_KEY']
  INSTANCE_URL = ENV['INSTANCE_URL']

  instance_url_request = Faraday.new(
    url: INSTANCE_URL,
    params: { api_key: API_KEY, language: 'en-US' },
    headers: { 'Content-Type' => 'application/json' }
  )

  def request_genres_movie
    response_genres = instance_url_request.get('genre/movie/list', { language: 'en-US' })
    parsed_response = JSON.parse(response_genres&.body || '{}')
    @genres = parsed_response
    @genres = @genres['genres']
    @genres
  rescue JSON::ParserError, TypeError => e
    puts e
  end

  def request_discover_movie(sort_by, page, with_genres, year, vote_avarege)
    response_data_movies = instance_url_request.get('discover/movie',
    { language: 'en-US', sort_by: "#{sort_by}", page: "#{page}", with_genres: "#{with_genres}", year: "#{year}",
    vote_avarege: "#{vote_avarege}" })
    parsed_response = JSON.parse(response_data_movies&.body || '{}')
    @movie_parameters = parsed_response
    @movie_parameters
  rescue JSON::ParserError, TypeError => e
    puts e
  end

  def request_movie_by_id(id)
    response_data_movies_by_id = instance_url_request.get("movie/#{id}", { language: 'en-US' })
    parsed_response = JSON.parse(response_data_movies_by_id&.body || '{}')
    response = parsed_response
    @movie_by_id = response['id']
    @movie_by_id
  rescue JSON::ParserError, TypeError => e
    puts e
  end

  def request_total_pages
    response_total_page_count = instance_url_request.get('discover/movie', { language: 'en-US' })
    parsed_response = JSON.parse(response_total_page_count&.body || '{}')
    response = parsed_response
    @total_page = response['total_pages']
    @total_page
  rescue JSON::ParserError, TypeError => e
    puts e
  end
end
