module Queries
  class FavoriteGenres < Queries::BaseQuery
    description I18n.t('list_genres')

    type [Types::GenreType], null: false

    def resolve
      current_user.genres
    end
  end
end
