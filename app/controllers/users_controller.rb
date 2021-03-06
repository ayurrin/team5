class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end
  #フォローする

  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to user_path(@user)
  end
  #フォローを外す


  def follow_list
    @user = User.find(params[:user_id])
  end
  #フォローしてる人の一覧ページ

  def follower_list
    @user = User.find(params[:user_id])
  end
  #フォロワーの一覧ページ
  def timeline
    @user = User.find(params[:user_id])
    @follow_users = @user.all_following
    @post =Post.all.where(user_id:@follow_users)
  end
end
