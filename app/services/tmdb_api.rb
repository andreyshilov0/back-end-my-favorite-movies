class TmdbApi
  API_KEY = ENV['API_KEY']
  INSTANCE_URL = ENV['INSTANCE_URL']

  def instance_faraday_url
    Faraday.new(url: INSTANCE_URL, params: { api_key: API_KEY, language: 'en-US' }, headers: { 'Content-Type' => 'application/json' })
  end

  def get_api_data(url, params = {})
    response_api_data = instance_faraday_url.get(url, params)
    data = JSON.parse(response_api_data.body || '{}')
    @data = data
    
  rescue JSON::ParserError, TypeError => e
    logger.info(e)
  end

  def genres_movie
    response_api_data = get_api_data('genre/movie/list')
    @response_api_data = response_api_data
  end
  
  def discover_movie(sort_by, page, with_genres, year, vote_average)
    response_api_data = get_api_data('discover/movie', { 'sort_by' => sort_by, 'page' => page, 'with_genres' => with_genres, 'year' => year,
      'vote_average' => vote_average })
    @response_api_data = response_api_data
      
  end

  def movie_by_id(id)
    response_api_data = get_api_data("movie/#{id}")
    @response_api_data = response_api_data
  end

  def total_pages
    response_api_data = get_api_data('discover/movie')
    @response_api_data = response_api_data['total_pages']
  end
end
