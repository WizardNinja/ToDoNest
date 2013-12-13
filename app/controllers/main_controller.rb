class MainController < ApplicationController
	def index
		gon.todos = Todo.all
	end
end
