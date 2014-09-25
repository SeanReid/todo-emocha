class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @tasks = Task.all.order(created_at: :desc)
    @task = Task.create(task_params)
  end

  def update
    @tasks = Task.all.order(created_at: :desc)
    @task.update_attributes(task_params)
  end

  def delete
    @task = Task.find(params[:task_id])
  end

  def destroy
    @tasks = Task.all.order(created_at: :desc)
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
