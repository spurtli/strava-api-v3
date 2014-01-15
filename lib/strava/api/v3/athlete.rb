require 'strava/api/v3/common'

module Strava::Api::V3
  module Athlete

    include Common
    # Fetch information about the current athlete
    # 
    # See {http://strava.github.io/api/v3/athlete/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block (TODO)
    #
    # @return TODO
    def get_current_athlete(args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athlete", args, "get", options, &block)
    end
  end
end