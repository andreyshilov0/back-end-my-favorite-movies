module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false
    field :token, String, null: false

    def resolve(email:, password:)
      new_user = User.create!(
        email:,
        password:
      )

      token = GenerateJwtToken.generate_token(new_user)
      { new_user:, token: }
    end
  end
end
