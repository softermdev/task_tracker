class Comment < ApplicationRecord
  acts_as_paranoid
  has_paper_trail

  # Associations
  belongs_to :user
  belongs_to :task

  # Validations
  validates :content, presence: true, length: { minimum: 1, maximum: 5000 }
  validates :user, presence: true
  validates :task, presence: true

  # Scopes
  scope :active, -> { where(deleted_at: nil) }
  scope :recent, -> { order(created_at: :desc) }
end
