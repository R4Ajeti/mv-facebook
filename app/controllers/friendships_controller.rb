# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friendships = Friendship.all.select do |friendship|
      friendship.friend_id == current_user.id && friendship.confirmed == false
    end
  end

  def create
    friendship = {}
    friendship[:user_id] = current_user.id
    friendship[:friend_id] = params[:id]
    friendship[:confirmed] = false
    @friendship = Friendship.new(friendship)
    requested = current_user.requested_friends.map(&:id)
    received = current_user.received_friends.map(&:id)
    if !requested.include?(params[:id].to_i) && !received.include?(params[:id].to_i) && @friendship.save
      flash[:success] = 'New request created!'
    else
      flash[:warning] = 'New request not created!'
    end
    redirect_to users_path
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship[:confirmed] = true
    if @friendship.save
      flash[:success] = 'New request accepted!'
    else
      flash[:warning] = 'New request not accepted!'
    end
    redirect_to friendships_path
  end
end
