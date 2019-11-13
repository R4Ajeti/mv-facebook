# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    @post = Post.find(params[:id])
    like = {}
    like[:post_id] = params[:id]
    like[:user_id] = current_user.id

    @like = Like.new(like)
    likers = @post.likers.map(&:id)
    if !likers.include?(current_user.id) && @like.save
      flash[:success] = 'New like added!'
    else
      flash[:warning] = 'New like not added!'
    end
    redirect_to root_path
  end
end
