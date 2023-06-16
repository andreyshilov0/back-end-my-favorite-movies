class Authentication
  def self.authenticate_request(token)
    return nil unless token.present?

    split_token = token.split(' ').last

    decoded_token = JWT.decode(split_token, ENV['HMAC_SECRET'], true, { algorithm: ENV['HMAC_ALGORITHM'] })
    null_hash = {}
    payload_data = decoded_token[0]
    header_data = decoded_token[1]
    merge_hash = null_hash.merge(payload_data, header_data)
    @current_user ||= User.find_by(id: merge_hash['id'])
  end
end
