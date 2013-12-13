class ToDoNest.Routers.Todos extends Backbone.Router
	routes:
		'': 'index'
		'todos/:id': 'show'

	initialize: ->
		@collection = collection

	index: ->
		view = new ToDoNest.Views.TodosIndex(collection: @collection)
		$('#todo_list').html(view.render().el)

	show: (id) ->
		view = new ToDoNest.Views.TodoShow({collection: @collection, id: id})
		$('#todo_list').html(view.render().el)
