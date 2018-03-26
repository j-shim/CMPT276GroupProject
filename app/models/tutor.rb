class Tutor < ApplicationRecord
	belongs_to :user, primary_key: 'user_id', autosave: true
	# has_many: tutor_sessions, dependent: :destroy
	# has_many: students, through: :tutor_sessions
	has_and_belongs_to_many :students 
	validates :school, presence:true, length: { maximum: 30 }
end
