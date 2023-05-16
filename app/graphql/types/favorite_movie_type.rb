# frozen_string_literal: true

module Types
  class FavoriteMovieType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :image_url, String
    field :year, Integer
    field :watched, Boolean
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end