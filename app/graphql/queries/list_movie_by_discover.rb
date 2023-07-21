module Queries
  class ListMovieByDiscover < Queries::BaseQuery
    description I18n.t('list_movie_by_discover')

    type [Types::MovieParametersType], null: false

    argument :sort_by, String, required: false
    argument :page, Integer, required: false
    argument :with_genres, [ID], required: false
    argument :year, Integer, required: false
    argument :vote_average, Integer, required: false
    argument :language, String, required: false

    def resolve(sort_by:, page:, with_genres:, year:, vote_average:, language:)
      @resolve ||= tmdb_api.discover_movie(sort_by, page, with_genres, year, vote_average, language)
      @resolve['results']
    end
  end
end
