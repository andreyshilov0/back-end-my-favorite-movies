module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def tmdb_api
      @tmdb_api ||= TmdbApi.new
    end

    private

    def current_user
      @current_user ||= context[:current_user]
    end
  end
end
