class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿が成功しました。'
    else
      @posts = Post.order(created_at: :desc)
      flash.now[:alert] = '投稿が失敗しました。'
      render:index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
