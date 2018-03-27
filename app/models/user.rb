class User < ApplicationRecord
    has_many :tutors, autosave: true
    has_many :students, autosave: true
    accepts_nested_attributes_for :tutors
    accepts_nested_attributes_for :students
    has_many :admins
    has_many :tutor_sessions, dependent: :destroy
    after_create :make_subuser_type
    #validates :username, presence: true, length: {maximum:50} #maximum length of the username is 50
    validates :firstname, presence: true, length: {minimum:2}
    validates :lastname, presence: true, length: {minimum:2}
    validates :gender, inclusion: ["male", "female"]
    validates :location, presence: true, length: {maximum:255}
    validates :role, presence: ["Tutor", "Student", "Admin"]
    validates :education_level, presence: true, length: {maximum:20}
    #befeore_save { email.downcase! }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :username, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  	has_secure_password
  	validates :password, presence: true, length: {minimum:6} #minimum length of the password is 6

    geocoded_by :location

end
