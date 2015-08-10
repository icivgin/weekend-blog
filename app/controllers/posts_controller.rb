class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    user = current_user
    p user
    post = Post.new(post_params)
    post.user_id = user.id
    post.save
    redirect_to root_path
  end

  def index
    @allPosts = Post.all
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def update
    post = Post.find_by_id(params[:id])
    if session[:user_id] == post[:user_id]
      post.update_attributes(post_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def destroy
    post = Post.find_by_id(params[:id])
    if session[:user_id] == post[:user_id]
      post.destroy
    end
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
