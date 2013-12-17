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
			hash = {"name" => "To-Do Nest"}
			hash["children"] = []
			arry = hash["children"]
			todos = Todo.where(todo_id: 0, user_id: current_user.id)
			todos.each do |todo|
				arry << build_tree(todo)
			end

			render json: hash
		else
			render json: {}
		end
	end

	def show_graph
		if current_user
			todo = Todo.where(id: params[:id], user_id: current_user.id)[0]
			render json: build_tree(todo)
		else
			render json: {}
		end
	end
end
