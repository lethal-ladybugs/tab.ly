class User < ActiveRecord::Base
	
	attr_reader :password 
	has_many :jobs
	has_secure_password 
	validates :email, :password_digest, presence: true 
	validates :password, length { minimum: 6, allow_nil: true}
	validates :password, confirmation: true

end
