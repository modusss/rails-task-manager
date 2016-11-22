class TasksController < ApplicationController
  # show all
  def index
    @task = Task.all
  end
  # show a specific row by id
  def show
    @task = Task.find(params[:id])
  end

  # create task:
  # request 1: get the form
  def new
  end
  # resquest 2: post the form
  def create
    @task = Task.new(params[:task])
    @task.save
  end

  # update task:
  # request 1: get the form
  def edit
    @task = Task.find(params[:id])
  end
  # request 2: patch the form
  def update
    @task = Task.find(params[:id])
    @task.save
  end

end
