class ToDoNest.Routers.Todos extends Backbone.Router
	routes:
		'': 'index'
		'todos/:id': 'show'
		'leafs': 'leafs'
		'index_graph': 'indexGraph'
		'show_graph/:id': 'showGraph'

	initialize: ->
		@collection = collection

	index: ->
		view = new ToDoNest.Views.TodosIndex(collection: @collection)
		$('#todo_list').html(view.render().el)
		$('#container').width(620)

	show: (id) ->
		view = new ToDoNest.Views.TodoShow({collection: @collection, id: id})
		$('#todo_list').html(view.render().el)
		$('#container').width(620)

	leafs: ->
		view = new ToDoNest.Views.TodosLeafs(collection: @collection)
		$('#todo_list').html(view.render().el)
		$('#container').width(620)

	indexGraph: ->
		$.get("api/index_graph").done (data) ->
			$('#todo_list').html("")
			width = (data["width"] + 1) * 350
			if width < 620
				width = 620
			height = data["height"] * 60
			d = data["tree"]
			$('#container').width(width)
			canvas = d3.select("#todo_list").append("svg")
			.attr("width", width)
			.attr("height", height + 60)
			.append("g")
			.attr("transform", "translate(50,50)")

			tree = d3.layout.tree().size([height - 60, width - 350])

			nodes = tree.nodes d
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

	showGraph: (id) ->
		$.get("api/show_graph/#{id}").done (data) ->
			$('#todo_list').html("")
			width = data["width"] * 350
			if width < 620
				width = 620
			height = data["height"] * 60
			d = data["tree"]
			console.log "setting container width"
			$('#container').width(width)

			canvas = d3.select("#todo_list").append("svg")
			.attr("width", width)
			.attr("height", height + 60)
			.append("g")
			.attr("transform", "translate(50,50)")

			tree = d3.layout.tree().size([height - 60, width - 350])

			nodes = tree.nodes d
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