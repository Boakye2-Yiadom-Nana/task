class CreateTodoTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.string :status

      t.timestamps
    end
  end
end
