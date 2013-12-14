class MainController < ApplicationController
	include MainHelper
	
	def index
		gon.todos = Todo.all
	end

	def index_graph
		hash = {"name" => "To-Do Nest"}
		hash["children"] = []
		arry = hash["children"]
		todos = Todo.where(todo_id: 0)
		todos.each do |todo|
			arry << build_tree(todo)
		end
		# todos.each do |todo|
		# 	if todo.todo_id == 0
		# 		arry << {"name" => "#{todo.description}"}
		# 	end
		# end
		render json: hash
	end

	def show_graph

	end
end
