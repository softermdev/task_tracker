class LabelsController < ApplicationController
  skip_load_and_authorize_resource
  before_action :set_project
  before_action :set_label, only: [:destroy]

  def create
    @label = @project.labels.build(label_params)
    authorize! :create, @label

    if @label.save
      redirect_to @project, notice: 'Label was successfully created.'
    else
      redirect_to @project, alert: 'Failed to create label.'
    end
  end

  def destroy
    authorize! :destroy, @label
    @label.destroy
    redirect_to @project, notice: 'Label was successfully deleted.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_label
    @label = @project.labels.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name, :color)
  end
end
