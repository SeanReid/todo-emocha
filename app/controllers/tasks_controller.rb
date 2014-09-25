class TasksController < ApplicationController
  before_action :order_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.create(task_params)
  end

  def update
    @task.update_attributes(task_params)
  end

  def delete
    @task = Task.find(params[:task_id])
  end

  def destroy
    @task.destroy
  end

  private
    def order_tasks
      @tasks = Task.all.order(created_at: :desc)
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title)
    end
end
