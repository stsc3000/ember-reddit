EmberReddit.SubredditsSubredditController = Ember.ObjectController.extend
  markAsRead: (link) ->
    @get('model').markAsRead(link)
  openAndMarkAsRead: (link) ->
    window.open link.get('url')
    @markAsRead(link)
