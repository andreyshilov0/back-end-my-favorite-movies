module Users
  class Authenticate
    include Interactor

    delegate :email, :password, :user, to: :context

    def call
      context.user = find_user
    rescue StandardError => e
      context.fail!(error: e.message) unless authenticated?
    end

    private

    def authenticated?
      user.present? && user.valid_password?(password)
    end

    def find_user
      User.find_by(email:)
    end
  end
end
