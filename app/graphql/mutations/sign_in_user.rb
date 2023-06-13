module Mutations
  class SignInUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    type Types::Payloads::SignInUserType

    def resolve(credentials: nil)
      return unless credentials

      user = User.find_by email: credentials[:email]

      response = user.authenticate(credentials[:password])

      return unless response

      token = encode_user_data({ user_data: user.id })

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token_crypt = crypt.encrypt_and_sign("id:#{user.id}")
      context[:session][:token] = token_crypt

      { user:, token: }
    end
  end
end
