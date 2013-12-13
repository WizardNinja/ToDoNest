user = User.create(email: "winjacan@gmail.com", password: "password", password_confirmation: "password")

todo = Todo.create(description: "stuff", user_id: user.id)
Todo.create(description: "step one for stuff", todo_id: todo.id, user_id: user.id)
Todo.create(description: "step two for stuff", todo_id: todo.id, user_id: user.id)
Todo.create(description: "other stuff", user_id: user.id)