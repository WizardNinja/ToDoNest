module MainHelper
	def build_tree(todo)
		todos = todo.todos
		if todos.empty?
			if todo.description.length > 32
				return {"name" => "#{todo.description[0..32]}..."}
			else
				return {"name" => "#{todo.description}"}
			end
		else
			if todo.description.length > 32
				hash = {"name" => "#{todo.description[0..32]}..."}
			else
				hash = {"name" => "#{todo.description}"}
			end
			hash["children"] = []
			children = hash["children"]
			todos.each do |td|
				children << build_tree(td)
			end
			return hash
		end
	end

	def find_height(todo)
		todos = todo.todos
		if todos.empty?
			return 1
		else
			height = 0
			todos.each do |td|
				height += find_height(td)
			end
			return height
		end
	end

	def find_width(todo)
		todos = todo.todos
		if todos.empty?
			return 1
		else
			width = 1
			todos.each do |todo|
				temp = 1 + find_width(todo)
				if temp > width
					width = temp
				end
			end
			return width
		end
	end
end
