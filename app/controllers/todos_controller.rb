class TodosController < ApplicationController
	respond_to :json

	def index
		if current_user
			respond_with current_user.todos
		else
			respond_with []
		end
	end

	def show
		if current_user
			respond_with Todo.where(id: params[:id], user_id: current_user.id)
		else
			respond_with []
		end
	end

	def create
		respond_with Todo.create(params[:todo])
	end

	def update
		if !Todo.where(id: params[:id], user_id: current_user.id).empty?
			respond_with Todo.update(params[:id], params[:todo])
		else
			respond_with []
		end
	end

	def destroy
		if !Todo.where(id: params[:id], user_id: current_user.id).empty?
			respond_with Todo.destroy(params[:id])
		else
			respond_with []
		end
	end
end
