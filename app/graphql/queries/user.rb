module Queries
  class User < Queries::BaseQuery
    description I18n.t('user')

    type [Types::UserType], null: true

    def resolve
      [{ email: current_user['email'], id: current_user['id'] }]
    end
  end
end
