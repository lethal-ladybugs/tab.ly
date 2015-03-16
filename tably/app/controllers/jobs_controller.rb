class JobsController < ApplicationController

	def show
		@jobs = Job.where(business_id: params["business_id"])
	end

	def create
		new_job = Job.create({user_id: current_user.id, position: params["position"], yelp_id: params[:business_id]})
		# redirect_to business_job_path(new_job.business, new_job)
	end

	def new
		@business_id = params[:business_id]
	end

end
