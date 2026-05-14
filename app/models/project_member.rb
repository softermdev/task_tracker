class ProjectMember < ApplicationRecord
  belongs_to :user
  belongs_to :project

  # Validations
  validates :user, presence: true
  validates :project, presence: true
  validates :user_id, uniqueness: { scope: :project_id, message: "already a member of this project" }
  validates :role, presence: true, inclusion: { in: %w[owner member] }

  # Scopes
  scope :owners, -> { where(role: 'owner') }
  scope :members, -> { where(role: 'member') }
end
