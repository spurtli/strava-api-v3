# strava-api-v3

[![Build Status](https://secure.travis-ci.org/jaredholdcroft/strava-api-v3.png)](http://travis-ci.org/jaredholdcroft/strava-api-v3) [![Code Climate](https://codeclimate.com/github/jaredholdcroft/strava-api-v3.png)](https://codeclimate.com/github/jaredholdcroft/strava-api-v3)

This gem provides a wrapper around the Strava API V3 - [http://strava.github.io/api/](http://strava.github.io/api/)

## Install

gem install 'strava-api-v3'

## Create a client

At this point you will need to have the user authorise your application using OAuth2.  

```ruby

@client = Strava::Api::V3::Client.new(:access_token => "MY_ACCESS_TOKEN")
```

## Call some methods

Each method returns a JSON object - see [http://strava.github.io/api/v3/athlete/](http://strava.github.io/api/v3/athlete/) for more info

### Athlete

```ruby

@client.retrieve_current_athlete # fetch the authenticated athlete

@client.retrieve_another_athlete(:some_id) # fetch another athlete by id

@client.list_athlete_segment_efforts(:some_id) # fetch K/QOMs/CRs for another athlete by id

```


## Contributors

* Jared Holdcroft
