class Project < ApplicationRecord
  acts_as_paranoid
  has_paper_trail

  # Associations
  belongs_to :owner, class_name: 'User'
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user
  has_many :tasks, dependent: :destroy
  has_many :labels, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :owner, presence: true

  # Scopes
  scope :active, -> { where(deleted_at: nil) }
  scope :archived, -> { where.not(deleted_at: nil) }

  # Methods
  def add_member(user, role: 'member')
    project_members.create(user: user, role: role)
  end

  def remove_member(user)
    project_members.find_by(user: user)&.destroy
  end

  def member?(user)
    owner_id == user.id || members.include?(user)
  end

  def owner?(user)
    owner_id == user.id
  end
end
