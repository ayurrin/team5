class PostsController < ApplicationController

  before_action :sakilog, except: :index

  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts/index")
  end

  def destroy
    # destroyアクションの中身を作成してください
    @post=Post.find_by(id: params[:id])
    @post.destroy

    redirect_to("/posts/index")
  end

private

    def post_params
      params.require(:post).permit(:content, :image)
    end

    def sakilog
      redirect_to action: :index unless user_signed_in?
    end


end
