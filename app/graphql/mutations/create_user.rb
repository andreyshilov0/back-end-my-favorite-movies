module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false
    field :token, String, null: false

    def resolve(email:, password:)
      new_user = User.new(
        email:,
        password:
      )
      raise GraphQL::ExecutionError, new_user.errors.full_messages.join(', ') unless new_user.save

      token = GenerateJwtToken.generate_token(new_user)

      { user: new_user, token: }
    end
  end
end
