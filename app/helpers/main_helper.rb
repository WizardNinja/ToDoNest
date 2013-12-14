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
end
