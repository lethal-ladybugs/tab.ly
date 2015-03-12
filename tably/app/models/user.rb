class User < ActiveRecord::Base
	
	attr_reader :password 
	has_secure_password 
	has_many :jobs
	validates :email, :password_digest, presence: true 
	validates :password, length { minimum: 6, allow_nil: true}
	validates :password, confirmation: true

end
