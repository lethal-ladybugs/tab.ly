class User < ActiveRecord::Base
	
	attr_reader :password 
	has_secure_password 
	validates :email, :password_digest, presence: true 
	validates :password, length: { minimum: 6, allow_nil: true}
	validates :password, confirmation: true
	has_many :jobs
	
end
