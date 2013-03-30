EmberReddit.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo "subreddits"
