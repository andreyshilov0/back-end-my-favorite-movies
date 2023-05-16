module Types
  class MutationType < Types::BaseObject
    field :favorite_movie_add, mutation: Mutations::FavoriteMovieAdd
    field :favorite_movie_delete, mutation: Mutations::FavoriteMovieDelete
  end
end
