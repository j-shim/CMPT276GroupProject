class TutorSession < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :subject, presence: true, length: { maximum: 30 }
  validates :date, presence: true
end
