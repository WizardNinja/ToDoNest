class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
    	t.string :description
    	t.boolean :completed, default: false
    	t.integer :user_id
    	t.integer :todo_id, default: 0
      t.timestamps
    end
  end
end
