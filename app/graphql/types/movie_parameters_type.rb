module Types
  class MovieParametersType < Types::BaseObject
    field :sort_by, String
    field :page, Integer
    field :with_genres, [Integer]
    field :year, Integer
    field :vote_average, Integer
    field :id, Integer, null: true
    field :title, String
    field :overview, String
    field :release_date, Integer
    field :poster_path, String
    field :total_pages, Integer, null: true
    field :language, String
  end
end
