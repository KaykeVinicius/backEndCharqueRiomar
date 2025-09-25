# # app/services/json_web_token.rb
# require 'jwt'
#
# class JsonWebToken
#   PRIVATE_KEY = OpenSSL::PKey::RSA.new(File.read(Rails.root.join("config/private.pem")))
#   PUBLIC_KEY  = OpenSSL::PKey::RSA.new(File.read(Rails.root.join("config/public.pem")))
#
#   def self.encode(payload, exp = 24.hours.from_now)
#     payload[:exp] = exp.to_i
#     JWT.encode(payload, PRIVATE_KEY, 'RS256')
#   end
#
#   def self.decode(token)
#     decoded = JWT.decode(token, PUBLIC_KEY, true, { algorithm: 'RS256' })
#     decoded[0].with_indifferent_access
#   rescue JWT::ExpiredSignature
#     raise StandardError, "Token expirado"
#   rescue JWT::DecodeError
#     raise StandardError, "Token inválido"
#   end
# end
