module Types
  class MutationType < Types::BaseObject
    field :favorite_movie_add, mutation: Mutations::FavoriteMovieAdd
    field :favorite_movie_delete, mutation: Mutations::FavoriteMovieDelete
    # TODO: remove me
    # field :test_field, String, null: false,
    #                            description: 'An example field added by the generator'
    # def test_field
    #   'Hello World'
    # end
  end
end
