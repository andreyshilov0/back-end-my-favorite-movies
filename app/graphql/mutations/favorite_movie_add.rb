module Mutations
  class FavoriteMovieAdd < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :year, Integer, required: true
    argument :image_url, String, required: true
    argument :watched, Boolean, required: true
    argument :user_id, Integer, required: true

    field :favorite_movie, Types::FavoriteMovieType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:, title: nil, year: nil, description: nil, image_url: nil, watched: false, user_id: nil)
      favorite_movie = FavoriteMovie.new(id:, title:, year:, description:, image_url:,
                                         watched:, user_id:)
      if favorite_movie.save
        {
          favorite_movie:,
          errors: []
        }
      else
        {
          errors: favorite_movie.errors
        }
      end
    end
  end
end
