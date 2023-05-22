module Queries
  class Genres < Queries::BaseQuery
    description I18n.t('list_genres')

    type [Types::GenreType], null: false

    def resolve
      response_app_controller = ApplicationController.current_user
      response_app_controller.genres
    end
  end
end
