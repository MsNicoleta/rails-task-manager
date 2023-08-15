class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @addtask = Task.new # Needed to instantiate the form_with
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :detailes, :completed)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
  #  if
    @task.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  #  else
  #   render 'edit', status: :unproccessable_entry
  end



  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/task/destroy.html.erb
    redirect_to task_path, status: :see_other
  end
end
