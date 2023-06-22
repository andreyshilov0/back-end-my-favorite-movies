module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false
    field :token, String, null: false

    def resolve(email:, password:)
      new_user = User.new(
        email:,
        password:
      )
      return execution_error(I18n.t('invalid_email_password')) unless new_user.save

      token = GenerateJwtToken.generate_token(new_user)

      { user: new_user, token: }
    end
  end
end
