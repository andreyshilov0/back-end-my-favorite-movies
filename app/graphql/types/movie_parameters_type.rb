module Types
  class MovieParametersType < Types::BaseObject
    field :sort_by, String
    field :page, Integer
    field :with_genres, Integer
    field :year, Integer
    field :popularity, Integer
    field :id, Integer
    field :title, String
    field :overview, String
    field :release_date, Integer
    field :poster_path, String
    field :total_pages, Integer
  end
end
