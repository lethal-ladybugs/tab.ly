class JobsController < ApplicationController

	def show
		@job = Job.find_by({id: params["id"]})
		@rating = Rating.new({job_id: params["id"]})
	end

	def create
		check_job = Job.find_by({user_id: current_user.id, business_id: params["id"]})
		if check_job
			flash[:notice] = "You are already an employee here"
			redirect_to '/businesses/' + params["id"].to_s
		else
			new_job = Job.create({user_id: current_user.id, position: params["position"], business_id: params["id"]})
			redirect_to '/businesses/' + params[:business_id] + '/jobs/' + new_job.id.to_s
		end
		# redirect_to business_job_path(new_job.business, new_job)
	end

	def new
		@business_id = params[:business_id]
	end

end
