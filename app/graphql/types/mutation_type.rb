module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::SignInUser
    field :create_user, mutation: Mutations::CreateUser
    field :favorite_movie_update_watched, mutation: Mutations::FavoriteMovieUpdateWatched
    field :favorite_genre_add, mutation: Mutations::FavoriteGenreAdd
    field :favorite_movie_add, mutation: Mutations::FavoriteMovieAdd
    field :favorite_movie_delete, mutation: Mutations::FavoriteMovieDelete
    field :favorite_genre_delete, mutation: Mutations::FavoriteGenreDelete
  end
end
