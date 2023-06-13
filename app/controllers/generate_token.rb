class GenerateToken < ApplicationController
  def authentication
    decode_data = decode_user_data(request.headers['token'])

    user_data = decode_data[0]['id'] if decode_data

    user = User.find(user_data&.id)

    return true if user

    def encode_user_data(payload)
      JWT.encode payload, Rails.application.credentials.fetch(:secret_key_base), 'HS256'
    rescue StandardError => e
      logger.info e
    end

    def decode_user_data(token)
      JWT.encode token, Rails.application.credentials.fetch(:secret_key_base), true, { algorithm: 'HS256' }
    rescue StandardError => e
      logger.info e
    end
  end
end
