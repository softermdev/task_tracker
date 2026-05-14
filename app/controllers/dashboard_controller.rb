class DashboardController < ApplicationController
  skip_load_and_authorize_resource

  def index
    @my_tasks = current_user.assigned_tasks.active.order(due_date: :asc).limit(10)
    @recent_projects = current_user.owned_projects.active.order(updated_at: :desc).limit(5)
    @overdue_tasks = current_user.assigned_tasks.overdue.limit(5)
  end
end
