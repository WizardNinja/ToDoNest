class ToDoNest.Views.TodoShow extends Backbone.View

  template: JST['todos/show']

  events:
    'submit #new_todo': 'createTodo'

  initialize: ->
    @collection.on('sync', @render, this)
    @collection.on('add', @render, this)

  render: ->
    $(@el).html(@template({todos: @collection, id: @id}))
    _.each(@collection.where({todo_id: parseInt(@id)}), @appendTodo)
    this

  appendTodo: (todo) =>
    view = new ToDoNest.Views.Todo(model: todo)
    @$('#todos').append(view.render().el)

  createTodo: (event) ->
    event.preventDefault()
    attributes = {description: $('#new_todo_description').val(),todo_id: @id, user_id: parseInt($("#user_id").html())}
    @collection.create attributes


