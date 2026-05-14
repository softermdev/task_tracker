module Api
  module V1
    class ProjectsController < BaseController
      def index
        render json: Project.all
      end

      private

      def set_project
        @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Project not found" }, status: :not_found
      end

      def project_params
        params.require(:project).permit(:name, :description, :due_date)
      end
    end
  end
end