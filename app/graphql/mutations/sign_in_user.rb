module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def authenticate_user(email, password)
      user = User.find_by(email:)

      return nil unless user

      user if user.valid_password?(password)
    end

    def resolve(email:, password:)
      return return_execution_error('Email and password are required') unless email.present? && password.present?

      user = authenticate_user(email, password)
      return return_execution_error('Invalid email or password') unless user

      token = GenerateJwtToken.generate_token(user)
      return return_execution_error('Unable to generate token') unless token

      { user:, token: }
    end
  end
end
