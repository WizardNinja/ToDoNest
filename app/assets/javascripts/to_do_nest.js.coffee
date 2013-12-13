window.ToDoNest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	new ToDoNest.Routers.Todos()
  	Backbone.history.start()

$(document).ready ->
  ToDoNest.initialize()
