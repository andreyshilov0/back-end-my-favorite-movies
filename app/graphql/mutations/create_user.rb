module Mutations
  class CreateUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    type Types::Payloads::CreateUserType

    def resolve(credentials: nil)
      create_user = User.new(
        email: credentials&.[](:email),
        password: credentials&.[](:password)
      )
      if create_user.save
        token = encode_user_data({ user_data: create_user.id })
        { token: }
      else
        { message: 'invalid credentials' }
      end
    end
  end
end
