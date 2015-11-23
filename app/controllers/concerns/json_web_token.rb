require "base64"
require "json"

module JsonWebToken
   class JsonWebToken

    def self.decode(token)
      JSON.parse(Base64.decode64(token.split('.')[1]))
    end
  end
end