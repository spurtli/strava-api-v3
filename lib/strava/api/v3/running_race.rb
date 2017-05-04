require 'strava/api/v3/common'

module Strava::Api::V3
  module RunningRace
    include Common

    # Retrieve details about a specific running race
    #
    # See {http://strava.github.io/api/v3/running_races/} for full details
    #
    # @param id running race id
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return running race json (see http://strava.github.io/api/v3/running_races/)
    def retrieve_running_race_details(id, args = {}, options = {}, &block)
      api_call("running_races/#{id}", args, 'get', options, &block)
    end

    # Retrieve a list of races occurring in a year, ordered by occurrence date from oldest to most recent
    #
    # See {http://strava.github.io/api/v3/running_races/} for full details
    #
    # @param args any additional arguments
    # @param options (see #get_object)
    # @param block post processing code block
    #
    # @return running races json (see http://strava.github.io/api/v3/running_races/)
    def list_running_races(args = {}, options = {}, &block)
      api_call('running_races', args, 'get', options, &block)
    end
  end
end
