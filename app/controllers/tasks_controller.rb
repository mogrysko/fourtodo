class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end
  def create
    list = List.find(params[:list_id])
    task = list.tasks.create!(task_params)
    redirect_to list_path(task.list)
  end
  def edit
    @task = Task.find(params[:id])
    @list = @task.list
  end
  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to list_path(task.list)
  end
  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to list_path(task.list)
  end

  private
  def task_params
    params.require(:task).permit(:taskname, :duedate, :completed)
  end
end
