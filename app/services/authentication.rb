class Authentication
  def self.authenticate_request(token)
    return nil unless token.present?

    split_token = token.split(' ').last

    decoded_token = JWT.decode(split_token, ENV['HMAC_SECRET'], true, { algorithm: ENV['HMAC_ALGORITHM'] })

    combined_hash = {}
    decoded_token.each { |hash| combined_hash.merge!(hash) }
    User.find_by(id: combined_hash['id'])
  end
end
