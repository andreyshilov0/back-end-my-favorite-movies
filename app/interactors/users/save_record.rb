module Users
  class SaveRecord
    include Interactor

    delegate :user, :email, :password, to: :context

    def call
      return if email && password.blank?

      context.user ||= create_user
    rescue StandardError => e
      context.fail!(error: e.message) unless save_user
    end

    private

    def save_user
      user.update(email && password)
    end

    def create_user
      User.new
    end
  end
end
