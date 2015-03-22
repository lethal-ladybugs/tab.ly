class RatingsController < ApplicationController

	def create
		@rating_check = Rating.find_by({job_id: params[:job_id], user_id: current_user})
		if !@rating_check
			@ratings = Rating.create({job_id: params[:job_id], user_id: current_user.id, good: params[:button]})
		end
		redirect_to '/businesses/' + params[:business_id].to_s + '/jobs/' + params[:job_id].to_s
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
