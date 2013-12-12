class ToDoNest.Views.Todo extends Backbone.View

  template: JST['todos/todo']

  initialize: ->
  	@collection.on('sync', @render, this)

  render: ->
  	$(@el).html(@template(todos: @collection))
  	this
