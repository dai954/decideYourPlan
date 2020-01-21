class PostsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :new]
  before_action :move_to_index_for_new, only: :new

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:place, :restaurant, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    post = Post.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == post.user_id
  end

  def move_to_index_for_new
    redirect_to root_path unless user_signed_in?
  end
end
