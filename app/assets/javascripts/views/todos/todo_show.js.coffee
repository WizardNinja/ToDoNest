class ToDoNest.Views.TodoShow extends Backbone.View

  template: JST['todos/show']

  events:
    'submit #new_todo': 'createTodo'
    '.click .destroy': 'updateTodos'

  initialize: ->
    @collection.on('sync', @render, this)
    @collection.on('add', @render, this)
    @collection.on('all', @render, this)

  render: ->
    $(@el).html(@template({todos: @collection, id: @id}))
    todo = @collection.findWhere({id: parseInt(@id)})
    if todo
      @$("#parent_todo").text(todo.get('description'))
      @$("#parent_todo").attr("href", "#todos/#{todo.get('todo_id')}")
    else
      @$("#parent_todo").html("To-Do Nest")
      @$("#parent_todo").attr("href", "")
    _.each(@collection.where({todo_id: parseInt(@id)}), @appendTodo)
    this

  appendTodo: (todo) =>
    view = new ToDoNest.Views.Todo({collection: @collection, model: todo})
    @$('#todos').append(view.render().el)

  createTodo: (event) ->
    event.preventDefault()
    attributes = {description: $('#new_todo_description').val(),todo_id: @id, user_id: parseInt($("#user_id").html())}
    @collection.create attributes

  updateTodos: (event) ->
    event.preventDefault()
    console.log "I'M DA BESS"


