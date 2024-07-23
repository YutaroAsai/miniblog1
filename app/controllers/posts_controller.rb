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
      flash.now[:alert] = @post.errors.full_messages.join(', ')
      render :index
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
