class PostsController < ApplicationController
  before_action :sakilog, except: :index
  before_action :edit_auth, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def show
    @post = Post.find_by(id: params[:id])
    @like = Like.new
  end
  def mypost
    @user = User.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to("/posts")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(post_params)
    redirect_to("/posts")
  end

  def destroy
    @post=Post.find_by(id: params[:id])
    @post.destroy

    redirect_to("/posts")
  end

private

    def post_params
      params.require(:post).permit(:content,:address,:comment, :image)
    end

    def sakilog
      redirect_to action: :index unless user_signed_in?
    end

    def edit_auth
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        flash[:notice]="権限がありません"
        redirect_to("/posts")
      end
    end



end
