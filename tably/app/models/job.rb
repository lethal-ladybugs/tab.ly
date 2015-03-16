class Job < ActiveRecord::Base

	has_many :ratings
	belongs_to :user

	enum status: [ :waiter, :bartender, :host, :barista ]
	
	def rating_count
		all_ratings = Rating.where({job_id: self.id})
		all_ratings.length
	end

end