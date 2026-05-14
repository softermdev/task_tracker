class Setting < ApplicationRecord
  belongs_to :user

  # Validations
  validates :user, presence: true, uniqueness: true
  validates :theme, inclusion: { in: %w[light dark], allow_nil: true }
  validates :language, inclusion: { in: %w[en th], allow_nil: true }
end
