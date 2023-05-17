module Queries
  class Genres < Queries::BaseQuery
    description I18n.t('list_genres')

    type [Types::GenreType], null: false

    def resolve
      ::Genre.all
    end
  end
end
