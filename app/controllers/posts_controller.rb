class PostsController < ApplicationController
  before_action :require_log_in, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(whitelist_params)
    @post.user_id = current_user.id

    if @post.save
        redirect_to posts_path
    else
        render 'new'
    end
  end
  

  private

  def whitelist_params
    params.require(:post).permit(:title, :description)
  end
end
