# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friendships = Friendship.all.select do |friendship|
      requested = current_user.requested_friends.map(&:id)
      friendship.friend_id == current_user.id && !requested.include?(friendship.user_id)
    end
  end

  def create
    friendship = {}
    friendship[:user_id] = current_user.id
    friendship[:friend_id] = params[:id]
    friendship[:confirmed] = true
    @friendship = Friendship.new(friendship)
    requested = current_user.requested_friends.map(&:id)
    if !requested.include?(params[:id].to_i) && @friendship.save
      flash[:success] = 'New request created!'
    else
      flash[:warning] = 'New request not created!'
    end
    redirect_to users_path
  end
end
