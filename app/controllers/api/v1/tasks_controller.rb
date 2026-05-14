module Api
  module V1
    class TasksController < BaseController
      def index
        render json: Task.all
      end

      private

      def set_task
        @task = Task.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Task not found" }, status: :not_found
      end

      def task_params
        params.require(:task).permit(:name, :description, :project_id, :user_id, :status)
      end
    end
  end
end