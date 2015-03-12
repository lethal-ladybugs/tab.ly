class JobsController < ApplicationController

	def show
		@jobs = Job.where(business_id: params["business_id"])
	end

	def create
		new_job = Job.create(user_id: params["user_id"], status: params["job_position"], business_id: params["business_id"])
		# redirect_to("")
	end

	def new
		@business = Business.all
	end

end
