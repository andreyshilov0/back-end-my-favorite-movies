module Mutations
  class FavoriteGenreAdd < BaseMutation
    argument :id, ID, required: true

    field :favorite_genre, Types::GenreType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:)
      current_user = context[:current_user]
      all_received_genres = tmdb_api.genres_movie['genres']
      genre_parameters = all_received_genres.find { |genre| genre['id'] == id.to_i }

      if genre_parameters
        favorite_genre = current_user.genres.build(id: genre_parameters['id'], name: genre_parameters['name'])

        if favorite_genre.save
          { favorite_genre:, errors: [] }
        else
          { favorite_genre: nil, errors: favorite_genre.errors.to_hash }
        end
      else
        { favorite_genre: nil, errors: { base: ['Genre not found'] } }
      end
    end
  end
end
