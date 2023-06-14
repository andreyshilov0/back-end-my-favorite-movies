class AuthenticationUser
  def self.current_user(header)
    decoded_token = JWT.decode(header, ENV['HMAC_SECRET'], true, ENV['HMAC_ALGORITHM']) if header
    # Я единственное не очень понимаю как здесь header обрабатывается правильно, так как по документации сюда jwt передают первым параметром
    # а тут он просит hash
    payload_data = decoded_token.reduce({}, :merge)

    @current_user ||= User.find_by(id: payload_data['id'])
  end
end
