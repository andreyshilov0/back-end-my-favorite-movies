module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email:, password:)
      return execution_error(I18n.t('email_password_required')) unless email.present? && password.present?

      user = User.find_by(email:)
      return execution_error(I18n.t('invalid_email_password')) unless user&.valid_password?(password)

      token = GenerateJwtToken.generate_token(user)
      return execution_error(I18n.t('unable_generate_token')) unless token

      { user:, token: }
    end
  end
end
