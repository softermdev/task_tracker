class TasksController < ApplicationController
  skip_load_and_authorize_resource
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authorize_task, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :read, @project
    @tasks = @project.tasks.active
  end

  def show
    @comments = @task.comments.active.recent
  end

  def new
    authorize! :create, Task.new(project: @project)
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.creator = current_user
    authorize! :create, @task

    if @task.save
      redirect_to [@project, @task], notice: 'Task was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to [@project, @task], notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @task
    @task.destroy
    redirect_to project_tasks_url(@project), notice: 'Task was successfully deleted.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def authorize_task
    authorize! :read, @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :due_date, :assignee_id, label_ids: [])
  end
end
