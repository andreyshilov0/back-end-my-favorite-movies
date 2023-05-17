module Queries
  class FavoriteMovie < Queries::BaseQuery
    description I18n.t('list_favorite_movies')

    argument :id, ID, required: true

    type [Types::FavoriteMovieType], null: false

    def resolve(id:)
      ::FavoriteMovie.find(id)
    end
  end
end
