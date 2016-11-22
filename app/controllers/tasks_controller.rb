class TasksController < ApplicationController
  # show all
  # each of these instance variables only can be accessed on their respective pages
  def index
    # so this variable here (@task) with this value assigned (= Task.all) has only
    # this attribution when we are on this very page (index)
    @tasks = Task.all
  end
  # show a specific row by id
  def show
    @task = Task.find(params[:id])
  end

  # create task:
  # request 1: get the form
  def new
    @task = Task.new(params[:task])
  end
  # resquest 2: post the form
  def create
    # 'params_task' returns the value that is authorized by this function
    # rails in default blocks any modifications so we have to give this access
    @task = Task.new(task_params)
    @task.save
    # we don't want to go to a kind of 'create's page' so we are redirecting to
    # out root page
    redirect_to tasks_path(@task)
  end

  # update task:
  # request 1: get the form
  def edit
    @task = Task.find(params[:id])
  end
  # request 2: patch the form
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    #@task.save
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

end
