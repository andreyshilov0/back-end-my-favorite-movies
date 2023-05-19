module Queries
  class Genres < Queries::BaseQuery
    description I18n.t('list_genres')

    type [Types::GenreType], null: false

    def resolve
      response_app_controller = ApplicationController.new
      response = response_app_controller.current_user
      response.genres
    end
  end
end
