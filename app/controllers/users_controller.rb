class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	user = User.create(user_params)
  	session[:user_id] = user.id
  	redirect_to profile_path
  end

  def show
    if current_user
  	  @user = current_user
      @user_posts = @user.posts
    else 
      redirect_to login_path
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:username, :password)
  	end

end
