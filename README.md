# hooktheory-ruby
An easy-to-use ruby wrapper around the Hooktheory API, useful for finding information for songs that have a particular chord progression. View the original API documentation here: 

See the [original API documentation](https://www.hooktheory.com/api/trends/docs) for additional information about HookTheory 

## Installation

```
gem install intercom
```

With bundler:

```ruby
gem 'hooktheory'
```

## Using the Client

Instantiate the HookTheory client with your account username and password _(sign up [here](https://www.hooktheory.com/signup?) if you don't have an account)_

```ruby
hooktheory = HookTheory::Client.new(username: "{username}", password: "{password}")
```

The HookTheory API has two endpoints which are both included in this wrapper:

```ruby
# Find songs that match a specific chord progression.
# Returns an array of HookTheory::Song objects
hooktheory.songs(progression: [1,4])
=> [#<HookTheory::Song:0x007fe64c8f4f78 @artist="ACDC", @song="You Shook Me All Night Long", @section="Chorus", @url="http://www.hooktheory.com/theorytab/view/acdc/you-shook-me-all-night-long#chorus">, ...]

# results are limited to 20 per request, so an optional page parameter can yield additional results
hooktheory.songs(progression: [1,4], page: 2)
=> [#<HookTheory::Song:0x007fe64c8b4bf8 @artist="Counting Crows", @song="Anna Begins", @section="Chorus", @url="http://www.hooktheory.com/theorytab/view/counting-crows/anna-begins#chorus">, ...]

# Find chord probabilities 
# Returns an array of HookTheory::Node objects
hooktheory.nodes
=> [#<HookTheory::Node:0x007fe64c87e170 @chord_id="1", @chord_html="I", @probability=0.145, @child_path="1">, ...]

# Optionally include a progression parameter to see what chords are most likely to come after a chord or chord progression
hooktheory.nodes(progression: [4])
=> [#<HookTheory::Node:0x007fe64c1e9990 @chord_id="1", @chord_html="I", @probability=0.289, @child_path="4,1">, ...]

hooktheory.nodes(progression: [4, 1, 2])
=> [#<HookTheory::Node:0x007fe64ca3c5c0 @chord_id="6", @chord_html="vi", @probability=0.468, @child_path="4,1,2,6">, ...]

# Any request that yield no results will return an empty array
hooktheory.nodes(progression: [4, 1, 2, 30838])
=> []
```

## Rate Limiting

Per the documentation, "The Hooktheory API limits requests to 10 every 10 seconds"

## TODO

+ Include rate limiting details in the client object
+ Throttled "fetch all songs" option for easy paging
