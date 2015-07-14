class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      redirect_to new_post_path, error: @post.errors.full_messages
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id]).update(post_params)
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: session[:id])
  end
end
