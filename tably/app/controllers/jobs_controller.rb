class JobsController < ApplicationController

	def show
		@job = Job.find_by({id: params["id"]})
		@business = Business.find_by({id: @job.business_id})
		@rating = Rating.new({job_id: params["id"]})
	end

	def create
		if current_user
			check_job = Job.find_by({user_id: current_user.id, business_id: params["id"]})
		else
			flash[:notice] = "You need to be signed in"
			redirect_to '/businesses/' + params["id"].to_s
		end
		if check_job
			flash[:notice] = "You are already an employee here"
			redirect_to '/businesses/' + params["id"].to_s
		else
			new_job = Job.create(jobs_params)
			redirect_to '/businesses/' + params[:business_id] + '/jobs/' + new_job.id.to_s
		end
	end

	def new
		@business_id = params[:business_id]
	end

	private
	def jobs_params
		params.require(:job).permit(:business_id, :position).merge(user_id: current_user.id)
	end

end
