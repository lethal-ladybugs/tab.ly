class RatingsController < ApplicationController

	def create
		@rating = Rating.new({
			job_id: params[:job_id],
			user_id: params[:user_id],
			good: params[:good]
			})
		if @rating.save
			render json: {rating: @rating, status: 'success'}
		else
			render json: {status: 'error'}
		end
	end

end