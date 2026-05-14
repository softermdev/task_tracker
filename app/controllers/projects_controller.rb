class ProjectsController < ApplicationController
  skip_load_and_authorize_resource only: [:index, :new, :create]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize_project, only: [:show, :edit, :update, :destroy]

  def index
    @owned_projects = current_user.owned_projects.active
    @member_projects = current_user.projects.active
  end

  def show
    @tasks = @project.tasks.active
    @members = @project.members
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.owned_projects.build(project_params)
    
    if @project.save
      # Add owner as project member
      @project.add_member(current_user, role: 'owner')
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize! :destroy, @project
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully deleted.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def authorize_project
    authorize! :read, @project
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
