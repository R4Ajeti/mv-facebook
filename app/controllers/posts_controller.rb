# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def create
    params = user_params
    params[:user_id] = current_user.id
    @post = Post.new(params)
    if @post.save
      flash[:success] = 'New post created!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def user_params
    params.require(:post).permit(:title, :description)
  end
end
