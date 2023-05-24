module Queries
  class FavoriteMovies < Queries::BaseQuery
    description I18n.t('list_favorite_movies')

    type [Types::FavoriteMovieType], null: false

    def resolve
      current_user = context[:current_user]
      current_user.favorite_movies
    end
  end
end
