class Label < ApplicationRecord
  belongs_to :project
  has_many :task_labels, dependent: :destroy
  has_many :tasks, through: :task_labels

  # Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :name, uniqueness: { scope: :project_id, message: "already exists in this project" }
  validates :color, format: { with: /\A#[0-9A-Fa-f]{6}\z/, message: "must be a valid hex color" }, allow_nil: true
  validates :project, presence: true
end
