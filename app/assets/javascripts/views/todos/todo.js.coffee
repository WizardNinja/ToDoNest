class ToDoNest.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'

  events:
  	'click .todo_link': 'redirectTodo'

  render: ->
  	$(@el).html(@template(todo: @model))
  	this

  redirectTodo: (event) ->
  	event.preventDefault()
  	id = $(event.target).attr('data')
  	window.location.href = "http://localhost:3000/#todos/#{id}"

