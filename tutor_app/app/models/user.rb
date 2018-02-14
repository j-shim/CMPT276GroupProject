class User < ApplicationRecord
    validates :username, presence: true, length: {maximum:50} #maximum length of the username is 50
    validates :password, presence: true, length: {minimum:6} #minimum length of the password is 50
end 
