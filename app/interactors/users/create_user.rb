module Users
  class CreateUser
    include Interactor::Organizer

    organize Users::SaveRecord,
             Users::GenerateToken
  end
end
