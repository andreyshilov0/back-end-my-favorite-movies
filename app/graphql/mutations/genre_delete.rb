# frozen_string_literal: true

module Mutations
  class GenreDelete < BaseMutation
    description "Deletes a genre by ID"

    field :genre, Types::GenreType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      genre = ::Genre.find(id)
      raise GraphQL::ExecutionError.new "Error deleting genre", extensions: genre.errors.to_hash unless genre.destroy

      { genre: genre }
    end
  end
end
