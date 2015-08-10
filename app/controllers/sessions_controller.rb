class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(username: user_params[:username]).try(:authenticate, user_params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		@error = 'There was an error logging in. Please try again.'
		render :new
	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

  private
  	def user_params
  		params.require(:user).permit(:username, :password)
  	end
end
