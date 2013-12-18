class MainController < ApplicationController
	include MainHelper
	
	def index
		if current_user
			gon.todos = current_user.todos
		else
			gon.todos = []
		end
	end

	def index_graph
		if current_user
			tree = {"name" => "To-Do Nest"}
			tree["children"] = []
			arry = tree["children"]
			height = 0
			width = 0
			todos = Todo.where(todo_id: 0, user_id: current_user.id)
			todos.each do |todo|
				arry << build_tree(todo)
				temp_height = find_height(todo)
				temp_width = find_width(todo)
				height += temp_height
				if temp_width > width
					width = temp_width
				end
			end
			
			hash = {"height" => height, "width" => width, "tree" => tree}

			render json: hash
		else
			render json: {}
		end
	end

	def show_graph
		if current_user
			todo = Todo.where(id: params[:id], user_id: current_user.id)[0]
			hash = {"height" => find_height(todo), "width" => find_width(todo), "tree" => build_tree(todo)}
			render json: hash
		else
			render json: {}
		end
	end
end
