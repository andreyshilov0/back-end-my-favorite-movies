module Queries
  class ListMovieByDiscover < Queries::BaseQuery
    description I18n.t('list_movie_by_discover')

    type [Types::MovieParametersType], null: false

    argument :sort_by, String, required: false
    argument :page, Integer, required: false
    argument :with_genres, ID, required: false
    argument :year, Integer, required: false
    argument :popularity, Integer, required: false

    def resolve(sort_by:, page:, with_genres:, year:, popularity:)
      @resolve ||= tmdb_api.discover_movie(sort_by, page, with_genres, year, popularity)
      @resolve['results']
    end
  end
end
