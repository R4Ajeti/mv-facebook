# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.created_posts
  end

  def index
    @users = User.all
  end
end
