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
      api_call("athletes/#{id}/koms", args, "get", options, &block)
    end

    # List athlete friends
    #
    # Friends are users the current athlete is following.
    # The activities owned by these users will appear in the current athlete’s activity feed.
    #
    def list_athlete_friends(args = {}, options = {}, &block)
      api_call("athlete/friends", args, "get", options, &block)
    end

    # List specific athlete friends
    #
    # Friends are users the current athlete is following.
    # The activities owned by these users will appear in the current athlete’s activity feed.
    #
    def list_specific_athlete_friends(id, args = {}, options = {}, &block)
      api_call("athletes/#{id}/friends", args, "get", options, &block)
    end

    # List specific athlete followers
    #
    # Friends are users the current athlete is following.
    # The activities owned by these users will appear in the current athlete’s activity feed.
    #
    def list_athlete_followers(args = {}, options = {}, &block)
      api_call("athlete/followers", args, "get", options, &block)
    end

    # Totals and stats
    # Returns recent (last 4 weeks), year to date and all time stats for a given athlete.
    # Only available for the authenticated athlete.
    # This is the recommended endpoint when polling for athlete upload events.
    #
    def list_specific_athlete_stats(id, args = {}, options = {}, &block)
      api_call("athletes/#{id}/stats", args, "get", options, &block)
    end
  end
end
