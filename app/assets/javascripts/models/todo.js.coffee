class ToDoNest.Models.Todo extends Backbone.Model
	defaults: ->
		{
			description: "empty todo..."
			completed: false
		}

	toggle: ->
		this.save {completed: !this.get('completed')}