class TutorSession < ApplicationRecord
  belongs_to :user
  # belongs_to :student, index: true, dependent: :destroy,
  # belongs_to :tutor, index: true, dependent: :destroy,
  default_scope -> { order(date: :asc) }
  validates :user_id, presence: true
  validates :subject, presence: true, length: { maximum: 30 }
  validates :date, presence: true
  validates :starttime, presence: true
  validates :endtime, presence: true
  time_duration = :calculate_time_duration  # :calculate_time_duration

  def calculate_time_duration
  	time_duration = (endtime - starttime)/3600
  end
end
