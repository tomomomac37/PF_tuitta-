class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @users = User.all
    @post = Post.new
    @posts = Post.order(created_at: :desc)
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # Post.create(post_params)
    respond_to do |format|
      if @post.save
        @posts = Post.all
        format.html { redirect_to @posts, notice: 'User was successfully created.' }
        format.json { render :index, status: :ok, location: @post }
        format.js
      else
        format.html { render :index }
        format.js { @status = "fail" }
      end
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, :image, :user_id)
  end
end
