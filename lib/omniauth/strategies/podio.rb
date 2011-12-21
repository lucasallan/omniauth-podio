require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Podio < OmniAuth::Strategies::OAuth2
      option :client_options, {
            :site => 'https://api.podio.com/',
            :authorize_url => 'https://podio.com/oauth/authorize'
          }

      def request_phase
        super
      end
      
    end
  end
end
