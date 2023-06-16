class GenerateToken
  def self.generate_token(payload)
    token = JWT.encode(payload, ENV['HMAC_SECRET'], ENV['HMAC_ALGORITHM'])
  rescue StandardError => e
    logger.info e
  end
end
