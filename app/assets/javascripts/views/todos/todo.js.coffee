class ToDoNest.Views.Todo extends Backbone.View
  template: JST['todos/todo']
  tagName: 'li'

  events:
    'click .todo_link': 'redirectTodo'
    'click .graph_link': 'redirectGraph'
    'dblclick .view': 'edit'
    'keypress .edit': 'updateOnEnter'
    'click .destroy': 'clear'
    'click .toggle': 'toggleDone'

  render: ->
    $(@el).html(@template(todo: @model))
    $(@el).toggleClass('done', @model.get('completed'))
    this

  redirectTodo: (event) ->
  	event.preventDefault()
  	id = $(event.target).attr('data')
  	window.location.href = "http://to-do-nest.herokuapp.com/#todos/#{id}"

  redirectGraph: (event) ->
    event.preventDefault()
    id = $(event.target).attr('data')
    window.location.href = "http://to-do-nest.herokuapp.com/#show_graph/#{id}"

  edit: () ->
    $(@el).toggleClass("editing");
    
  updateOnEnter: (event) ->
    if event.keyCode == 13
      value = event.target.value
      if value
        @model.save {description: value}
        $(@el).toggleClass("editing")

  clear: (event) ->
    event.preventDefault()
    todos = @collection.where(todo_id: @model.get('id'))
    _.each(todos, (todo) ->
      todo.save(todo_id: @model.get('id'))
    )
    this.model.destroy()

  toggleDone: (event) ->
    this.model.toggle();
