module Strava
  module Api
    module V3
      module Configuration
        VALID_CONNECTION_KEYS = [:endpoint, :user_agent, :method].freeze
        VALID_OPTIONS_KEYS    = [:access_token, :client_id, :client_secret].freeze
        VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS
     
        DEFAULT_ENDPOINT    = 'https://www.strava.com/api'
        DEFAULT_METHOD      = :get
        DEFAULT_USER_AGENT  = "Strava API V3 Ruby Gem #{Strava::Api::V3::VERSION}".freeze
     
        DEFAULT_ACCESS_TOKEN  = nil
        DEFAULT_CLIENT_ID     = nil
        DEFAULT_CLIENT_SECRET = nil
     
        # Build accessor methods for every config options so we can do this, for example:
        #   Strava::Api:V3.format = :xml
        attr_accessor *VALID_CONFIG_KEYS
     
        # Make sure we have the default values set when we get 'extended'
        def self.extended(base)
          base.reset
        end
     
        def reset
          self.endpoint   = DEFAULT_ENDPOINT
          self.method     = DEFAULT_METHOD
          self.user_agent = DEFAULT_USER_AGENT
     
          self.access_token    = DEFAULT_ACCESS_TOKEN
          self.client_id     = DEFAULT_CLIENT_ID
          self.client_secret     = DEFAULT_CLIENT_SECRET
        end

        def configure
          yield self
        end        
      end
    end
  end
end