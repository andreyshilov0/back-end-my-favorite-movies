module Mutations
  class SignInUser < BaseMutation
    null true

    argument :credentials, Types::AuthProviderCredentialsInput, required: false

    type Types::Payloads::SignInUserType

    def resolve(credentials: nil)
      result = login_user(credentials)

      result.success? ? result : execution_error(message: result.error)
    end

    def login_user(credentials: nil)
      Users::Login.call(credentials)
    end
  end
end
