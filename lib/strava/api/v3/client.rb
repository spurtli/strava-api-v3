require 'strava/api/v3/athlete'
require 'strava/api/v3/activity'
require 'strava/api/v3/gear'

module Strava::Api::V3

  class Client

    include Athlete
    include Activity
    include Gear

    # Define the same set of accessors as the Awesome module
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      # Merge the config values from the module and those passed
      # to the client.
      merged_options = Strava::Api::V3.options.merge(options)

      # Copy the merged values to this client and ignore those
      # not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end

      puts self.access_token
    end

  end # Client

end
