EmberReddit.Subreddit = Ember.Object.extend
  name: ""
  links: []
  id: ( ->
    @get('name')
  ).property("name")
  unreadLinkCount: ( ->
    @links.length
  ).property("links.@each")
  load: ->
    $.ajax(
      url: "http://www.reddit.com/r/" + @name + "/.json?jsonp=?",
      dataType: "jsonp",
      jsonpCallback: @name
    ).then((response) =>
      @set 'links', []
      for jsonLink in response.data.children
        @links.pushObject EmberReddit.Link.create(jsonLink.data)
      return @links
      @set('state', "loaded")
    ).fail( (response) =>
      EmberReddit.Subreddit.delete @
    )
  markAsRead: (link) ->
    @get('links').removeObject(link)

EmberReddit.Subreddit.reopenClass Ember.Observable,
  all: []
  add: (name) ->
    @initialize { name: name }
  delete: (subreddit) ->
    @all.removeObject(subreddit)
  initialize: (properties) ->
    subreddit = EmberReddit.Subreddit.create properties
    @all.pushObject subreddit
    subreddit.load()
    subreddit
  find: (name) ->
    result = @all.findProperty 'name', name
    unless result
      result = @initialize { name: name }
    result
