class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @tasks = Task.all
    @task = Task.create(task_params)
  end

  def update
    @tasks = Task.all
    @task.update_attributes(task_params)
  end

  def delete
    @task = Task.find(params[:task_id])
  end

  def destroy
    @tasks = Task.all
    @task.destroy
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
