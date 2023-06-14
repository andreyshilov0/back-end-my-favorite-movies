module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email: nil, password: nil)
      user = User.find_by(email:)
      response = user.valid_password?(password:)
      res = !response
      # devise почему то не хочет делать валидацию я для проверки так сделал.

      if res
        auth_user = user.jwt_payload
        token = GenerateToken.generate_token(auth_user)
        decode_data = AuthenticationUser.current_user(token)
      else
        StandardError => e
        logger.info e
      end

      return if decode_data

      { user:, token: }
    end
  end
end
