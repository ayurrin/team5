class MapsController < ApplicationController
  def index        
    @user = User.find(params[:id])
    gon.posts_contents=@user.liked_posts.pluck(:address)
  end


end
