require 'strava/api/v3/common'

module Strava::Api::V3
  module Upload
    include Common

    def upload_an_activity(args = {}, options = {}, &block)
      api_call("uploads", args, 'post', options, &block)
    end

  end
end
