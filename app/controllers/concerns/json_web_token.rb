require "base64"

module JsonWebToken
   class JsonWebToken

    def self.decode(token)
      Base64.decode64(token.split('.')[1])
   end
  end
end