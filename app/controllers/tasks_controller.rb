class TasksController < ApplicationController
  def index
    user = User.find(session[:user_id])
    @tasks = user.tasks
  end
  def new
    @task = Task.new
  end
  def create
    Task.create(task_params)
    redirect_to tasks_path
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_path
  end
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:taskname, :duedate, :completed).merge(user_id: session[:user_id])
  end
end
