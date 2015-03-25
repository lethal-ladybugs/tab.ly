class RatingsController < ApplicationController

	def create
		@rating_check = Rating.find_by({job_id: params[:job_id], user_id: current_user})
		if !@rating_check && current_user
			@ratings = Rating.create(rating_params)
		end
		redirect_to '/businesses/' + params[:business_id].to_s + '/jobs/' + params[:job_id].to_s
	end

	private 
	def rating_params
		params.require(:rating).permit(:job_id, :good).merge(user_id: current_user.id, job_id: params[:job_id])
	end
end
	# 	@rating = Rating.new({
	# 		job_id: params[:job_id],
	# 		user_id: params[:user_id],
	# 		good: params[:good]
	# 		})
	# 	if @rating.save
	# 		render json: {rating: @rating, status: 'success'}
	# 	else
	# 		render json: {status: 'error'}
	# 	end
