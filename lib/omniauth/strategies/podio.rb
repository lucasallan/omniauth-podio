require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Podio < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.podio.com/',
        :authorize_url => 'https://podio.com/oauth/authorize',
        :token_url => "https://podio.com/oauth/token"
      }
      
      def request_phase
        super
      end
      
      info do
        {
          :email => raw_info["mail"],
          :user_id => raw_info["user_id"]
          
        }
      end
      
      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/user').body)
      end
    end
  end
end
