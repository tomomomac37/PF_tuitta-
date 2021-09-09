class PostsController < ApplicationController
  

  def index
    @user = current_user
    @post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    end
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:user_id, :body, :image_id)
  end
end
