class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index 
		@users = User.all 
	end

	def show
		@user = User.find_by(id: params[:id])
	end 

	def new 
		@user = User.new 
	end 

	def create 
		@user = User.new(user_params)

		if @user.save 

			redirect_to root_url 

		else 

		 redirect_to new_url 

		end

	def update 
		@user.update(user_params)
		redirect_to @user
	end

	def destroy 
		@user.destroy 
		redirect_to users_url 
	end

	private 

	def set_user 
		@user = User.find(params[:id])
	end

	def user_params 
		params.require(:user).permit(:email, :f_name, :l_name, :password, :confirmation_password)
	end

end
