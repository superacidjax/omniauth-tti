require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class TtiAppAuthorizer < OmniAuth::Strategies::OAuth2
      option :name, 'ttiappauthorizer'

      option :client_options, {
        site: "http://localhost:3000",
        authorize_url: "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"]
          role: raw_info["role"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end