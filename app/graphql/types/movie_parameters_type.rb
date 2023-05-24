module Types
  class MovieParametersType < Types::BaseObject
    field :sort_by, String
    field :page, Integer
    field :with_genres, String
    field :year, Integer
    field :vote_average, Integer
    field :popularity, Integer
  end
end
