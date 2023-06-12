module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::Payloads::CreateUserType

    def resolve(**params)
      result = create_user(params)

      result.success? ? result : execution_error(message: result.error)
    end

    private

    def create_user(params)
      Users::CreateUser.call(auth_provider: params)
    end
  end
end
