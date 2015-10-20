require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Podio < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site:          'https://api.podio.com/',
        authorize_url: 'https://podio.com/oauth/authorize',
        token_url:     'https://podio.com/oauth/token'
      }
      
      def request_phase
        super
      end

      uid do
        raw_info["user"]["user_id"]
      end
      
      info do
        profile_info = raw_info["profile"]
        user_info    = raw_info["user"]
        email        = user_info["mail"]
        verified     = user_info["mails"].any?{|mail| mail["mail"] == email && mail["verified"] == true}

        {
          email:     email,
          verified:  verified,
          name:      profile_info["name"],
          user_id:   profile_info["user_id"].to_s,
          image:     profile_info["image"] && profile_info["image"]["link"],
          location:  profile_info["location"] && profile_info["location"][0],
          status:    user_info["status"],
          time_zone: user_info["timezone"],
          locale:    user_info["locale"]
        }
      end
      
      extra do
        {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('/user/status').body)
      end
    end
  end
end
