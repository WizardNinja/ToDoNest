class ToDoNest.Routers.Todos extends Backbone.Router
	routes:
		'': 'index'
		'todos/:id': 'show'
		'index_graph': 'indexGraph'

	initialize: ->
		@collection = collection

	index: ->
		view = new ToDoNest.Views.TodosIndex(collection: @collection)
		$('#todo_list').html(view.render().el)

	show: (id) ->
		view = new ToDoNest.Views.TodoShow({collection: @collection, id: id})
		$('#todo_list').html(view.render().el)

	indexGraph: ->
		$('#todo_list').html("")
		canvas = d3.select("#container").append("svg")
		.attr("width", 500)
		.attr("height", 500)
		.append("g")
		.attr("transform", "translate(50,50)")

		tree = d3.layout.tree().size([400,400])

		$.get("api/index_graph").done (data) ->
			nodes = tree.nodes data
			links = tree.links nodes

			node = canvas.selectAll(".node")
			.data(nodes)
			.enter()
			.append("g")
			.attr("class", "node")
			.attr("transform", (d) -> return "translate(#{d.y},#{d.x})")

			node.append("circle")
			.attr("r", 5)
			.attr("fill", "steelblue")

			node.append("text")
			.text((d) -> return d.name)
			.attr("transform", (d) -> return "translate(#{-10},#{20})")

			diagonal = d3.svg.diagonal()
			.projection((d) -> return [d.y, d.x])

			canvas.selectAll(".link")
			.data(links)
			.enter()
			.append("path")
			.attr("class", "link")
			.attr("fill", "none")
			.attr("stroke", "#ADADAD")
			.attr("d", diagonal)