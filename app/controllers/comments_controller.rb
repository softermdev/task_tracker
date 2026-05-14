class CommentsController < ApplicationController
  skip_load_and_authorize_resource
  before_action :set_task
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user
    authorize! :create, @comment

    if @comment.save
      redirect_to project_task_path(@task.project, @task), notice: 'Comment was successfully created.'
    else
      redirect_to project_task_path(@task.project, @task), alert: 'Failed to create comment.'
    end
  end

  def destroy
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to project_task_path(@task.project, @task), notice: 'Comment was successfully deleted.'
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_comment
    @comment = @task.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
