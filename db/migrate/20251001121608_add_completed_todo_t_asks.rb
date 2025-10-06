class AddCompletedTodoTAsks < ActiveRecord::Migration[8.0]
  def change
       add_column :todo_tasks, :completed, :boolean, default: false
  
  end
end
