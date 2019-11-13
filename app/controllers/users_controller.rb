# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.created_posts
  end

  def index
    requested = current_user.requested_friends.map(&:id)
    received = current_user.received_friends.map(&:id)
    @users = User.all.select do |user|
      !requested.include?(user.id) && !received.include?(user.id) && user.id != current_user.id
    end
    @friends = User.all.select do |user|
      requested.include?(user.id) && received.include?(user.id) && user.id != current_user.id
    end
  end
end
