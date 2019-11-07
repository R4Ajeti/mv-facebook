# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:id])
    params = user_params
    params[:user_id] = current_user.id
    @comment = @post.comments.build(params)
    if @comment.save
      flash[:success] = 'New comment added!'
    else
      flash[:warning] = 'New comment not added!'
    end
    redirect_to root_path
  end

  def show; end

  def user_params
    params.require(:comment).permit(:text)
  end
end
