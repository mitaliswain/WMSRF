require "base64"

module JsonWebToken
   class JsonWebToken

    def self.decode(token)
      Base64.decode64(token)
   end
  end
end