class User < ApplicationRecord
    has_many :tutor_sessions, dependent: :destroy
    #validates :username, presence: true, length: {maximum:50} #maximum length of the username is 50
    validates :firstname, presence: true, length: {minimum:2}
    validates :lastname, presence: true, length: {minimum:2}
    validates :gender, inclusion: ["male", "female"]
    validates :location, presence: true, length: {maximum:255}
    validates :role, presence: ["Tutor", "Student", "Admin"]
    #before_save { email.downcase! }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :username, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  	has_secure_password
  	validates :password, presence: true, length: {minimum:6} #minimum length of the password is 6
  	# Returns the hash digest of the given string.
  	# def User.digest(string)
   #  	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
   #  		 BCrypt::Engine.cost
   #  	BCrypt::Password.create(string, cost: cost)
   #  end

   #  def password
	  #   @password ||= Password.new(password_hash)
	  # end

    geocoded_by :location

end
