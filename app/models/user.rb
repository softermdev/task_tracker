class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  # Associations
  has_one :setting, dependent: :destroy
  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id', dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :projects, through: :project_members
  has_many :created_tasks, class_name: 'Task', foreign_key: 'creator_id', dependent: :nullify
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id', dependent: :nullify
  has_many :comments, dependent: :destroy

  # Callbacks
  after_create :create_default_setting

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :name, length: { maximum: 50 }, allow_blank: true

  # Scopes
  scope :admins, -> { where(admin: true) }

  # Methods
  def admin?
    admin
  end

  def owner_of?(project)
    project.owner_id == id
  end

  def member_of?(project)
    project_members.exists?(project_id: project.id)
  end

  private

  def create_default_setting
    create_setting
  end
end
