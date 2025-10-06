class AddCategoryToTodoTasks < ActiveRecord::Migration[8.0]
  def change
    add_reference :todo_tasks, :category, null: true, foreign_key: true
  end
end
