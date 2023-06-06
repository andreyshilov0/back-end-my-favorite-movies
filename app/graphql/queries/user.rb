module Queries
  class User < Queries::BaseQuery
    description I18n.t('user')

    type [Types::UserType], null: true

    def resolve
      [{ login: current_user['login'], id: current_user['id'] }]
    end
  end
end
