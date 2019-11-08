# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.created_posts
  end

  def index
    requested_friends = current_user.requested_friends.map(&:id)
    received_friends = current_user.received_friends.map(&:id)
    @users = User.all.select do |user|
      !requested_friends.include?(user.id) && !received_friends.include?(user.id) && user.id != current_user.id
    end
  end
end
