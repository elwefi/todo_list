class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_task_all, only: [:index, :all_tasks, :create, :update, :destroy, :save_complete]
  respond_to :html, :js

  def index
  end
  
  # MODIF POSITION TASKS
  def update_row_order
    @task = Task.find(task_params[:task_id])
    @task.row_order_position = task_params[:row_order_position]
    @task.save

    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  # COMPLETED TASKS
  def finished
    @tasks = Task.finished
  end

  # ALL TASKS
  def all_tasks
  end

  # NOT COMPLETED TASKS
  def unfinished
    @tasks = Task.unfinished
  end
  
  def show
  end

  def new
    @task = Task.new
    @category = Category.all
  end

  def edit
    @category = Category.all
  end

  def create
    @task = Task.create(task_params)
  end

  def update
    @task.update(task_params)
  end

  def delete
    @task = Task.find(params[:task_id])
  end

  def destroy
    @task.destroy
  end

  def complete
    @task = Task.find(params[:task_id])
  end

  def save_complete
    @task = Task.find(params[:task_id])
    @task.complete = true
    @task.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_task_all
      @tasks = Task.rank(:row_order)
      @complete = Task.finished
      @uncomplete = Task.unfinished
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task_id, :name, :row_order_position, :complete, :category_id, :parent_id)
    end
end
