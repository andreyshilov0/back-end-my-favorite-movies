module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :token, String, null: false
    field :user, Types::UserType, null: false

    def resolve(email:, password:)
      user = User.find_by(email:)
      return execution_error(I18n.t('invalid_email')) unless user

      if user.valid_password?(password)
        token = GenerateJwtToken.generate_token(user)
        execution_error(I18n.t('unable_generate_token')) unless token

        { user:, token: }
      else
        execution_error(I18n.t('invalid_password'))
      end
    end
  end
end
