class TmdbApi
  API_KEY = ENV['API_KEY']
  INSTANCE_URL = ENV['INSTANCE_URL']

  def instance_faraday_url
    instance_faraday_url ||= Faraday.new(url: INSTANCE_URL, params: { api_key: API_KEY, language: 'en-US' },
                                         headers: { 'Content-Type' => 'application/json' })
  end

  # Тоесть логика экземпляра метода в том чтобы каждый раз создавать новый экземпляр и обрабатывать всё занового через него?

  def get_api_data(url, params = {})
    response_api_data = TmdbApi.new
    response = response_api_data.instance_faraday_url.get(url, params)
    data = JSON.parse(response.body || '{}')
  rescue JSON::ParserError, TypeError => e
    logger.info(e)
  end

  def genres_movie
    get_api_data('genre/movie/list')
  end

  def discover_movie(sort_by, page, with_genres, year, vote_average, popularity)
    get_api_data('discover/movie', { 'sort_by' => sort_by, 'page' => page, 'with_genres' => with_genres, 'year' => year,
                                     'vote_average' => vote_average, 'popularity' => popularity })
  end

  def movie_by_id(id)
    get_api_data("movie/#{id}")
  end

  def total_pages
    get_api_data('discover/movie', { 'total_pages' => 'total_pages' })
  end
end
