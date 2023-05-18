module Types
  class MutationType < Types::BaseObject
    field :favorite_genre_add, mutation: Mutations::FavoriteGenreAdd
    field :favorite_movie_add, mutation: Mutations::FavoriteMovieAdd
    field :favorite_movie_delete, mutation: Mutations::FavoriteMovieDelete
    field :favorite_genre_delete, mutation: Mutations::FavoriteGenreDelete
  end
end
