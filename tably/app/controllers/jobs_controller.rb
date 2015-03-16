class JobsController < ApplicationController

	def show
		@jobs = Job.where(business_id: params["business_id"])
	end

	def create
		new_job = Job.create({user_id: current_user.id, position: params["position"], yelp_id: params[:business_id]})
		return 'YAY!'
	end

	def new
		@business = Business.all
	end

end
