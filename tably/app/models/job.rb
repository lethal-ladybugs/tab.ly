class Job < ActiveRecord::Base

	has_many :ratings
	belongs_to :user

	enum status: [ :waiter, :bartender, :host, :barista ]
	
end