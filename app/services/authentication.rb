class Authentication
  def self.authenticate_request(token)
    return nil unless token.present?

    split_token = token.split(' ').last

    decoded_token = JWT.decode(split_token, ENV['HMAC_SECRET'], true, { algorithm: ENV['HMAC_ALGORITHM'] })

    null_hash = [{}]
    decoded_token.each { |hash| null_hash[0].merge!(hash) }
    payload_data = null_hash.first
    User.find_by(id: payload_data['id'])
  end
end
