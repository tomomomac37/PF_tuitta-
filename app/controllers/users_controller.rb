class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
 
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.js { render json: { status: 'success' } }
      else
        render "edit"
        format.js { @status = "fail"}
      end
    end
  end
  
  def mypage
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
