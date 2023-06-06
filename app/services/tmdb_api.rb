class TmdbApi
  API_KEY = ENV['API_KEY']
  INSTANCE_URL = ENV['INSTANCE_URL']

  def tmdb_api
    @tmdb_api ||= TmdbApi.new
  end

  def instance_faraday_url
    @instance_faraday_url ||= Faraday.new(url: INSTANCE_URL, params: { api_key: API_KEY, language: 'en-US' },
                                          headers: { 'Content-Type' => 'application/json' })
  end

  def get_api_data(url, params = {})
    response = instance_faraday_url.get(url, params)
    JSON.parse(response.body || '{}')
  rescue JSON::ParserError, TypeError => e
    logger.info(e)
  end

  def genres_movie
    tmdb_api.get_api_data('genre/movie/list')
  end

  def discover_movie(sort_by, page, with_genres, year, popularity)
    tmdb_api.get_api_data('discover/movie', { 'sort_by' => sort_by, 'page' => page, 'with_genres' => with_genres, 'year' => year,
                                              'popularity' => popularity })
  end

  def movie_by_id(id)
    tmdb_api.get_api_data("movie/#{id}")
  end

  def total_pages
    tmdb_api.get_api_data('discover/movie', { 'total_pages' => 'total_pages' })
  end
end
