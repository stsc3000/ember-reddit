EmberReddit.SubredditsRoute = Ember.Route.extend
  model: ->
    EmberReddit.Subreddit.get('all')
