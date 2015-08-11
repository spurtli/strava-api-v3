require 'strava/api/v3/common'

module Strava::Api::V3
  module Athlete

    include Common

    # This request is used to retrieve information about the currently authenticated athlete.
    #
    # See {http://strava.github.io/api/v3/athlete/#get-details} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return athlete json (see http://strava.github.io/api/v3/athlete/#get-details)
    def retrieve_current_athlete(args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athlete", args, "get", options, &block)
    end

    # This request is used to retrieve information about any athlete on Strava.
    #
    # See {http://strava.github.io/api/v3/athlete/#get-another-details} for full details
    #
    # @param id athlete id
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return athlete json (see http://strava.github.io/api/v3/athlete/#get-another-details)
    def retrieve_another_athlete(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athletes/#{id}", args, "get", options, &block)
    end

    # Returns an array of segment efforts representing KOMs/QOMs and course records held by the given athlete.
    # Results are sorted by date, newest first. Pagination is supported.
    #
    # See {http://strava.github.io/api/v3/athlete/#koms} for full details
    #
    # @param id athlete id
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return segment effort json array (see http://strava.github.io/api/v3/athlete/#koms)
    def list_athlete_segment_efforts(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athletes/#{id}/koms", args, "get", options, &block)
    end

    # Returns an array of recent (last 4 weeks), year to date and all time stats for a given athlete.
    #
    # See {http://strava.github.io/api/v3/athlete/#stats} for full details
    #
    # @param id athlete id
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return segment effort json array (http://strava.github.io/api/v3/athlete/#stats)
    def totals_and_stats(id, args = {}, options = {}, &block)
      # Fetches the connections for given object.
      api_call("athletes/#{id}/stats", args, "get", options, &block)
    end
  end
end
