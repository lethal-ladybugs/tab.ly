class Job < ActiveRecord::Base

	has_many :ratings
	belongs_to :user
	belongs_to :business

	enum status: [ :waiter, :bartender, :host, :barista ]
	
	def rating_count
		all_ratings = Rating.where({job_id: self.id, good: true})
		all_ratings.length
	end

end