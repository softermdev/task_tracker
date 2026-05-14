class ProjectMembersController < ApplicationController
  skip_load_and_authorize_resource
  before_action :set_project
  before_action :set_project_member, only: [:destroy]

  def create
    @user = User.find_by(email: params[:email])
    
    if @user.nil?
      redirect_to @project, alert: 'User not found.'
      return
    end

    @project_member = @project.project_members.build(user: @user, role: 'member')
    authorize! :create, @project_member

    if @project_member.save
      redirect_to @project, notice: 'Member was successfully added.'
    else
      redirect_to @project, alert: @project_member.errors.full_messages.join(', ')
    end
  end

  def destroy
    authorize! :destroy, @project_member
    @project_member.destroy
    redirect_to @project, notice: 'Member was successfully removed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_project_member
    @project_member = @project.project_members.find(params[:id])
  end
end
