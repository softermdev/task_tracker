class Task < ApplicationRecord
  acts_as_paranoid
  has_paper_trail

  # Associations
  belongs_to :project
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true
  has_many :task_labels, dependent: :destroy
  has_many :labels, through: :task_labels
  has_many :comments, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :status, presence: true, inclusion: { in: %w[todo in_progress done] }
  validates :priority, inclusion: { in: %w[low medium high], allow_nil: true }
  validates :project, presence: true
  validates :creator, presence: true

  # Scopes
  scope :active, -> { where(deleted_at: nil) }
  scope :archived, -> { where.not(deleted_at: nil) }
  scope :by_status, ->(status) { where(status: status) }
  scope :by_priority, ->(priority) { where(priority: priority) }
  scope :assigned_to, ->(user) { where(assignee: user) }
  scope :created_by, ->(user) { where(creator: user) }
  scope :overdue, -> { where('due_date < ?', Date.today).where.not(status: 'done') }

  # Methods
  def assign_to(user)
    update(assignee: user)
  end

  def add_label(label)
    labels << label unless labels.include?(label)
  end

  def remove_label(label)
    labels.delete(label)
  end

  def overdue?
    due_date.present? && due_date < Date.today && status != 'done'
  end
end
