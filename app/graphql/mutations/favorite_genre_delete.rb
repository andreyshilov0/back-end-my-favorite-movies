# frozen_string_literal: true

module Mutations
  class FavoriteGenreDelete < BaseMutation
    field :favorite_genre, Types::GenreType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      favorite_genre = Genre.find(id)
      unless favorite_genre.destroy
        raise GraphQL::ExecutionError.new 'Error deleting favorite_genre',
                                          extensions: favorite_genre.errors.to_hash
      end

      { favorite_genre: }
    end
  end
end
