module Queries
  class FavoriteMovies < Queries::BaseQuery
    description I18n.t('list_favorite_movies')

    type [Types::FavoriteMovieType], null: false

    def resolve
      ::FavoriteMovie.all
    end

    # Если нам не нужны ни FavoriteMovie ни Genres в запросах, как мы тогда сможем обращаться к ним с фронта?
    # Моё предположение было в том что мы будем по id искать и жанры и фильмы и как то их добавлять на страницу.

  end
end
