class ToDoNest.Routers.Todos extends Backbone.Router
	routes:
		'': 'index'
		'todos/:id': 'show'

	initialize: ->
		@collection = new ToDoNest.Collections.Todos()
		@collection.fetch()

	index: ->
		view = new ToDoNest.Views.TodosIndex(collection: @collection)
		$('#todos').html(view.render().el)

	show: (id) ->
		view = new ToDoNest.Views.TodoShow({collection: @collection, id: id})
		$('#todos').html(view.render().el)
