class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # redirecting to the show view of the task
    redirect_to task_path(@task)
  end

  def show
    # @task = Task.find(params[:id])
  end

  def edit
  end

  def update
    # find the task
    # update the task with the strong params
    @task.update(task_params)
    # redirect to the show view of the task
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    # @task.destroy
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
