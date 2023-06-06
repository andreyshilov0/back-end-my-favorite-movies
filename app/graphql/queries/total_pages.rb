module Queries
  class TotalPages < Queries::BaseQuery
    description I18n.t('total_pages')

    type [Types::TotalPagesType], null: false

    def resolve
      @response ||= tmdb_api.total_pages['total_pages']
      [{ total_pages: @response }]
    end
  end
end
