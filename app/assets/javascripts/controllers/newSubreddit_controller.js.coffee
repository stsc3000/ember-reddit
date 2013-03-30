EmberReddit.NewSubredditController = Ember.Controller.extend
  addNewSubreddit: ->
    EmberReddit.Subreddit.add @get('newSubredditName')
