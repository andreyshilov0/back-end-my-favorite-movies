module Users
  class Login
    include Interactor::Organizer

    organize Users::Authenticate,
             Users::GenerateToken
  end
end
