module Types
  class GenreApiType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
  end
end
