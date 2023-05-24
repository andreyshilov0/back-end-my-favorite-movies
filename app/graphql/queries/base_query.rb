module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    def tmdb_api
      @tmdb_api ||= TmdbApi.new
    end
  end
end
