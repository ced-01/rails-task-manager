class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def create
    def create
      @task = Restaurant.new(task_params)
      if @task.save
        redirect_to task_path(@task)
      else
        render :new
      end
    end
  end

  def new
    @task = Task.new
  end

  def show
  end

  def edit
  end

  def update
    task.update(task_params)
    redirect_to task_path(@task) # @task important ? faut pas ?
  end

  def destroy
    task.destroy
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  # Permet de ne pas repeter @task = Task.find(params[:id]) dans show edit update destroy + code apres class en haut
  def set_tasks
    set_tasks = Task.find(params[:id])
  end
end
