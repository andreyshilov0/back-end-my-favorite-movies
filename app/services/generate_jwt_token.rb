class GenerateJwtToken
  def self.generate_token(payload)
    JWT.encode(payload, ENV['HMAC_SECRET'], ENV['HMAC_ALGORITHM'])
  rescue StandardError => e
    logger.error "Failed to generate JWT token: #{e.message}"
  end
end
