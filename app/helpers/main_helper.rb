module MainHelper
	def build_tree(todo)
		todos = todo.todos
		if todos.empty?
			return {"name" => "#{todo.description}"}
		else
			hash = {"name" => "#{todo.description}"}
			hash["children"] = []
			children = hash["children"]
			todos.each do |td|
				children << build_tree(td)
			end
			return hash
		end
	end

	def find_height(todo)
		data = build_todo_data(todo)
		height = 0
		data.each do |d|
			length = d.length
			if length > height
				height = length
			end
		end
		return height
	end

	def find_width(todo)
		todos = todo.todos
		if todos.empty?
			return 1
		else
			width = 2
			todos.each do |todo|
				temp = 1 + find_width(todo)
				if temp > width
					width = temp
				end
			end
			return width
		end
	end

	def build_todo_data(level, data, todo)
		todos = todo.todos
		if todos.empty?
			data[level] << todo.description
		else
			unless data[level + 1]
				data << []
			end
			data[level] << todo.description
			todos.each do |td|
				data = build_todo_data(level + 1, data, td)
			end
		end
		return data
	end
end
