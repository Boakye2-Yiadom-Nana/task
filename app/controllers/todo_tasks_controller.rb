class TodoTasksController < ApplicationController
  def index
    @q =params[:q]
    @category_id = params[:category_id]
    @status = params[:status]
    @priority = params[:priority]

    @todo_tasks = TodoTask.all
    @todo_tasks = @todo_tasks.where("title LIKE ? OR description LIKE ?", "%#{@q}%", "#{@q}%") if @q.present?
    @todo_tasks = @todo_tasks.where(category_id: @category_id) if @category_id.present?
    @todo_tasks = @todo_tasks.where(status: @status) if @status.present?
    @todo_tasks = @todo_tasks.where(priority: @priority) if @priority.present?

    @todo_tasks = @todo_tasks.order(due_date: :asc)
 
  end

  def show
    @todo_task = TodoTask.find_by(params[:id])
  end

  def new
    @todo_task = TodoTask.new
  end

  def create
     @todo_task = TodoTask.new(todo_task_params)
     if @todo_task.save
      redirect_to @todo_task, notice: 'Tod task was successfully created'
     else
      render :new, status: :unprocessable_entity
     end

  end

  def edit
    @todo_task = TodoTask.find(params[:id])

  end

  def update
    @todo_task = TodoTask.find(params[:id])
    if @todo_task.update(todo_task_params)
      redirect_to @todo_task, notice: 'Todo task was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
   

end

 def destroy
   @todo_task = TodoTask.find(params[:id])
    @todo_task.destroy
    redirect_to todo_tasks_url, notice: 'Todo task was successfully desytroyed'
 end

 def toggle_complete
   @todo_task = TodoTask.find(params[:id])
   @todo_task.update(completed: !@todo_task.completed)

   respond_to do |format|
    format.html { redirect_to  todo_tasks_path }
    format.turbo_stream
   end
  end

  # def completed?
  #   status == 'completed'
  # end

 private
 def todo_task_params
    params.require(:todo_task).permit(:title, :description, :due_date, :status, :category_id, :priority,  attachments: [])
 end
end

