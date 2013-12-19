class ToDoNest.Views.TodosLeafs extends Backbone.View

  template: JST['todos/leafs']

  events:
    'submit #new_todo': 'createTodo'

  initialize: ->
    @collection.on('sync', @render, this)
    @collection.on('add', @render, this)
    @collection.on('all', @render, this)

  render: ->
    $(@el).html(@template(todos: @collection))
    @collection.each(@appendTodo)
    $('#new_todo_description').focus()
    this

  appendTodo: (todo) =>
    if(@collection.where(todo_id: todo.get('id')).length == 0)
      view = new ToDoNest.Views.Todo({collection: @collection, model: todo})
      @$('#todos').append(view.render().el)

  createTodo: (event) ->
    event.preventDefault()
    attributes = {description: $('#new_todo_description').val(), user_id: parseInt($("#user_id").html())}
    @collection.create attributes

