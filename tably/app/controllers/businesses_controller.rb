class BusinessesController < ApplicationController

	def index
		@business = Bussiness.all()
	end

	def show
		@business = Business.find_by(params[:id])
	end

end
