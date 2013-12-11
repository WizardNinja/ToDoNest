class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
    	t.string :description
    	t.boolean :completed
    	t.integer :user_id
    	t.integer :todo_id
      t.timestamps
    end
  end
end
