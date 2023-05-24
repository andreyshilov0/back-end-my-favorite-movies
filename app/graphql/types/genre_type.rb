module Types
  class GenreType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :user_id, ID, null: false
  end
end
