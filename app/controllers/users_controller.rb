# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @events = @user.created_events
    # @att_events = @user.attended_events

    # @prev_events = @user.attended_events.previous_events.all
    # @upcoming_events = @user.attended_events.upcoming_events.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the Event App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
