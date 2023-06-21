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
      return GraphQL::ExecutionError.new('Email and password are required') unless email.present? && password.present?

      user = authenticate_user(email, password)
      return GraphQL::ExecutionError.new('Invalid email or password') unless user

      token = GenerateJwtToken.generate_token(user)
      return GraphQL::ExecutionError.new('Unable to generate token') unless token

      { user:, token: }
    end
  end
end
