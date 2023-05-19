module Queries
  class FavoriteMovies < Queries::BaseQuery
    description I18n.t('list_favorite_movies')

    type [Types::FavoriteMovieType], null: false

    def resolve
      response_app_controller = ApplicationController.new
      response = response_app_controller.current_user
      response.favorite_movies
    end
  end
end
