module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false

    def resolve(email: nil, password: nil)
      new_user = User.create!(
        email:,
        password:
      )
      new_user || { message: 'Invalid data' }

      return unless new_user

      { new_user: }
    end
  end
end
