require 'httparty'
require 'multi_json'

module Strava::Api::V3
  module Common
    # Make a call directly to the Strava API.
    # (See any of the other methods for example invocations.)
    #
    # @param path the Strava API path to query (no leading / needed)
    # @param args (see #get_object)
    # @param verb the type of HTTP request to make (get, post, delete, etc.)
    # @param options request-related options, currently unused
    #
    # @yield response when making a batch API call, you can pass in a block
    #        that parses the results, allowing for cleaner code.
    #        The block's return value is returned in the batch results.
    #
    # @raise [Stava::Api::V3::APIError] if Strava returns an error
    #
    # @return the result from Strava
    def api_call(path, args = {}, verb = "get", options = {}, &post_processing)
      result = api(path, args, verb, options) do |response|
        #error = check_response(response.code, response.body)
        #raise error if error
      end


      # now process as appropriate for the given call (get picture header, etc.)
      post_processing ? post_processing.call(result) : result
    end

    # Makes a request to the appropriate Facebook API.
    # @note You'll rarely need to call this method directly.
    #
    # @see GraphAPIMethods#graph_call
    # @see RestAPIMethods#rest_call
    #
    # @param path the server path for this request (leading / is prepended if not present)
    # @param args arguments to be sent to Facebook
    # @param verb the HTTP method to use
    # @param options request-related options, currently unused
    # @param error_checking_block a block to evaluate the response status for additional JSON-encoded errors
    #
    # @yield The response for evaluation
    #
    # @raise [Strava::Api::V3::ServerError] if Strava returns an error (response status >= 500)
    #
    # @return the body of the response from Strava (TODO)
    def api(path, args = {}, verb = "get", options = {}, &error_checking_block)
      # If a access token is explicitly provided, use that
      # This is explicitly needed in batch requests so GraphCollection
      # results preserve any specific access tokens provided
      args["access_token"] ||= self.access_token ||= Strava::Api::V3::Configuration::DEFAULT_ACCESS_TOKEN

      puts args
      # Translate any arrays in the params into comma-separated strings
      args = sanitize_request_parameters(args)

      # add a leading /
      path = "/#{path}" unless path =~ /^\//

      # make the request via the provided service
      result = HTTParty.get("#{Strava::Api::V3::Configuration::DEFAULT_ENDPOINT}#{path}", :query => args)

      if result.code.to_i >= 500
        raise Strava::Api::V3::ServerError.new(result.code.to_i, result.body)
      end

      yield result if error_checking_block

      # if we want a component other than the body (e.g. redirect header for images), return that
      if component = options[:http_component]
        component == :response ? result : result.send(options[:http_component])
      else
        # parse the body as JSON and run it through the error checker (if provided)
        # Note: Facebook sometimes sends results like "true" and "false", which aren't strictly objects
        # and cause MultiJson.load to fail -- so we account for that by wrapping the result in []
        MultiJson.load("[#{result.body.to_s}]")[0]
      end
    end
    # Sanitizes Ruby objects into Strava-compatible string values.
    #
    # @param parameters a hash of parameters.
    #
    # Returns a hash in which values that are arrays of non-enumerable values
    #         (Strings, Symbols, Numbers, etc.) are turned into comma-separated strings.
    def sanitize_request_parameters(parameters)
      parameters.reduce({}) do |result, (key, value)|
        # if the parameter is an array that contains non-enumerable values,
        # turn it into a comma-separated list
        # in Ruby 1.8.7, strings are enumerable, but we don't care
        if value.is_a?(Array) && value.none? {|entry| entry.is_a?(Enumerable) && !entry.is_a?(String)}
          value = value.join(",")
        end
        result.merge(key => value)
      end
    end
end
end