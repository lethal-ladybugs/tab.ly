class RatingsController < ApplicationController

	def create
		@ratings = Rating.create({job_id: params[:job_id], user_id: current_user.id, good: params[:button]})
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