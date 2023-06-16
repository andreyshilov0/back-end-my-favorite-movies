module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email:, password:)
      return nil unless email && password.present?

      user = User.find_by(email:)
      token = GenerateJwtToken.generate_token(user) if user && user.valid_password?(password:)

      return unless token

      { user:, token: }
    end
  end
end
