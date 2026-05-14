class TaskLabel < ApplicationRecord
  belongs_to :task
  belongs_to :label

  # Validations
  validates :task, presence: true
  validates :label, presence: true
  validates :task_id, uniqueness: { scope: :label_id, message: "already has this label" }
  validate :task_and_label_same_project

  private

  def task_and_label_same_project
    if task && label && task.project_id != label.project_id
      errors.add(:base, "Task and Label must belong to the same project")
    end
  end
end
