class SessionsController < ApplicationController

	def new 
		user = User.new
	end

	def create 
		
		user = User.find_by_email(params[:user][:email])
		
			if user && user.authenticate(params[:user][:password])

				token = SecureRandom.urlsafe_base64
			
				session[:session_token] = token 
        
				user.session_token = token 
				
				user.save
	
				redirect_to(:back)
				
			else 
			  render :new 
			end
	end

	def destroy

    user = current_user
		
    if user
			session[:session_token] = nil

      user.session_token = nil
   	  user.save
    end

    redirect_to(:back)
  
  end

end
