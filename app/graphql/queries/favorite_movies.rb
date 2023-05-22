module Queries
  class FavoriteMovies < Queries::BaseQuery
    description I18n.t('list_favorite_movies')

    type [Types::FavoriteMovieType], null: false

    def resolve
      response_app_controller = ApplicationController.current_user
      response_app_controller.favorite_movies
    end
  end
end
