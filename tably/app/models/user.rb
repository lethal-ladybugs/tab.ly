class User < ActiveRecord::Base
	
	attr_reader :password
	attr_accessor :password_confirmation
	has_secure_password 
	validates :email, presence: true 
	validates :password, 
						:presence => true, 
						:length => { :minimum => 6}
	has_many :jobs

end
                              
