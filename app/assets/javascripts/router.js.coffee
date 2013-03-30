EmberReddit.Router.map ->
  @resource "subreddits", ->
    @route('subreddit', { path: ':subreddit_id' })
