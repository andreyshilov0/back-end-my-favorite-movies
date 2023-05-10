require 'faraday'
require 'pry'

class GetTmbdApi
  API_KEY = ENV['API_KEY']
  INSTANCE_URL = ENV['INSTANCE_URL']

  instance_url_request = Faraday.new(
    url: INSTANCE_URL,
    params: { api_key: API_KEY, language: 'en-US' },
    headers: { 'Content-Type' => 'application/json' }
  )

  private

  def get_api_data(_url, _params = {})
    @genres_url = instance_url_request.get('movie/genre/list', _params = {})

    @discover_movie_url = instance_url_request.get('discover/movie',
                                                   _params = {})

    @movie_by_id_url = instance_url_request.get('movie/', _params = {})

    @total_page_url = instance_url_request.get('discover/movie', _params = {})
  end

  def genres_movie
    response_api_data = get_api_data(@genres_url)
    @genres = JSON.parse(response_api_data.body || '{}')
    @genres
  rescue JSON::ParserError, TypeError => e
    logger.info(e)
  end

  def discover_movie
    response_api_data = get_api_data(@discover_movie_url,
                                     _params => { sort_by => 'sort_by', page => 'page', with_genres => 'with_genres', year => 'year',
                                                  vote_avarege => 'vote_avarege' })
    @movie_parameters = JSON.parse(response_api_data&.body || '{}')
    @movie_parameters
  rescue JSON::ParserError, TypeError => e
    logger.info(e)
  end

  def movie_by_id
    response_api_data = get_api_data(@movie_by_id_url, _params => { id => 'id' })
    @movie_by_id = JSON.parse(response_api_data&.body || '{}')
    @movie_by_id
  rescue JSON::ParserError, TypeError => e
    logger.info(e)
  end

  def total_pages
    response_api_data = get_api_data(@total_page_url, _params => { total_page => 'total_page' })
    @total_page = JSON.parse(response_api_data&.body || '{}')
    @total_page
  rescue JSON::ParserError, TypeError => e
    logger.info(e)
  end
end
