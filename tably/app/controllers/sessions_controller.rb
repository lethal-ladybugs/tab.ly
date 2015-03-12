class SessionsController < ApplicationController

	def new 
		@user = User.new
	end

	def create 
		@user = User.find_by_email(params[:email])

			if @user && @user.authenticate(params[:password])
				token = SecureRandom.urlsafe_base64

				session[:session_token] = token 

				@user.session_token = token 
				@user.save 

				redirect_to root_url 

			else 

			 	redirect_to new_session_url
			
			end
	end

	def destroy 

		@user = current_user 

		token = SecureRandom.urlsafe_base64
		session[:session_token] = token 

		if @user 
			@user.session_token = nil 
			@user.save 
		end 

			redirect_to root_url 

	end

end
