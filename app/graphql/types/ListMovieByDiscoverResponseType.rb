module Types
  class ListMovieByDiscoverResponseType < Types::BaseObject
    field :movies, [Types::MovieParametersType], null: false
    field :total_pages, Integer, null: false
  end
end
