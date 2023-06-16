module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email: nil, password: nil)
      user = User.find_by(email:)
      response = user.valid_password?(password:)
      if response
        auth_user = user.jwt_payload
        token = GenerateToken.generate_token(auth_user)
      else
        StandardError => e
        logger.info e
      end

      return unless token

      { user:, token: }
    end
  end
end
