class DashboardController < ApplicationController
  skip_load_and_authorize_resource

  def index
    # Get all projects where user is owner or member
    user_projects = Project.active.where(owner_id: current_user.id)
                           .or(Project.active.where(id: current_user.project_ids))
    
    # Get all tasks from user's projects
    @my_tasks = Task.active
                    .where(project_id: user_projects.pluck(:id))
                    .order(due_date: :asc, created_at: :desc)
    
    @recent_projects = user_projects.order(updated_at: :desc).limit(5)
    @overdue_tasks = Task.active
                         .where(project_id: user_projects.pluck(:id))
                         .where('due_date < ?', Date.today)
                         .where.not(status: 'done')
                         .limit(5)
  end
end
