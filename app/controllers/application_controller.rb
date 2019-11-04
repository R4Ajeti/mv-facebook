# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  # Confirms a logged-in user.
  def logged_in_user
    flash[:danger] = 'Please log in.' unless logged_in?
    redirect_to login_url unless logged_in?
  end
end
