module Queries
  class ListGenres < Queries::BaseQuery
    description I18n.t('list_genres')

    type [Types::GenreType], null: false

    def resolve
      tmdb_api.genres_movie['genres']
    end
  end
end
