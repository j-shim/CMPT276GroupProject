class Student < ApplicationRecord
	belongs_to :user, primary_key: 'user_id', autosave: true
	# has_many: tutor_sessions
	# has_many: tutors, through: :tutor_sessions
	has_and_belongs_to_many :tutors
	validates :age, numericality: { only_integer: true }
end
