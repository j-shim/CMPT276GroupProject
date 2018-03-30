class Tutor < ApplicationRecord
	belongs_to :user, primary_key: 'user_id', autosave: true
	has_many :tutor_sessions
	# has_many: students, through: :tutor_sessions
	has_and_belongs_to_many :students 
	validates :school, presence:true, length: { maximum: 30 }
	validates :rate, numericality: { greater_than_or_equal_to: 10.00 }
	validates :bio, length: { minimum: 10}
	validates :subjects, length: { minimum: 4}
end
