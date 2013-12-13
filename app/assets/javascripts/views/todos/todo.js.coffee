class ToDoNest.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'

  events:
    'click .todo_link': 'redirectTodo'
    'click .destroy': 'clear'
    'click .toggle': 'toggleDone'

  render: ->
    $(@el).html(@template(todo: @model))
    $(@el).toggleClass('done', @model.get('completed'))
    this

  redirectTodo: (event) ->
  	event.preventDefault()
  	id = $(event.target).attr('data')
  	window.location.href = "http://localhost:3000/#todos/#{id}"

  clear: (event) ->
    event.preventDefault()
    this.model.destroy()

  toggleDone: (event) ->
    this.model.toggle();
