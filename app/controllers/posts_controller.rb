class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    @posts = Post.all
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
      flash[:notice]="トゥイート成功"
    else
      render "index"
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
      redirect_to posts_path
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:body, :image_id)
  end
end
