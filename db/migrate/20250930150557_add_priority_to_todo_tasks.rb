class AddPriorityToTodoTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :todo_tasks, :priority, :string
  end
end
