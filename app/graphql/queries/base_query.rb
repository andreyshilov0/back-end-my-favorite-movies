module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    def tmdb_api
      @tmdb_api ||= TmdbApi.new
    end

    def current_user
      @current_user = context[:current_user]
    end
  end
end
