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
    # @param block post processing code block
    #
    # @return athlete json (see http://strava.github.io/api/v3/athlete/)
    def retrieve_current_athlete(args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athlete", args, "get", options, &block)
    end

    # Fetch information about a specific athlete
    # 
    # See {http://strava.github.io/api/v3/athlete/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return athlete json (see http://strava.github.io/api/v3/athlete/)
    def retrieve_another_athlete(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athletes/#{id}", args, "get", options, &block)
    end

    # Fetch information about a specific athlete
    # 
    # See {http://strava.github.io/api/v3/athlete/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return athlete json (see http://strava.github.io/api/v3/athlete/)
    def list_athlete_segment_efforts(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athletes/#{id}/komsd", args, "get", options, &block)
    end
  end
end