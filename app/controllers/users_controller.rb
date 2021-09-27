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
    if @user == current_user
      render "edit"
    else
      redirect_to posts_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end
  
  def mypage
    @following_users = current_user.following_user
    @follower_users = current_user.follower_user
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
end
