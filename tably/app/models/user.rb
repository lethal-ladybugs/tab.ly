class User < ActiveRecord::Base
	
	attr_reader :password
	attr_accessor :password_confirmation
	
	has_secure_password 
	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password, 
						:presence => true, 
						:length => { :minimum => 6},
						:on => :create
	
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates_attachment :avatar,
  										:content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  										:size => { :in => 0..200.kilobytes }
	validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
	
	has_many :jobs

	def fullname
		self.f_name + " " + self.l_name
	end

end
                              
