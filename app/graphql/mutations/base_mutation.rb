module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def tmdb_api
      @tmdb_api ||= TmdbApi.new
    end

    def current_user
      @current_user ||= context[:current_user]
    end

    def return_execution_error(message)
      GraphQL::ExecutionError.new(message)
    end
  end
end
