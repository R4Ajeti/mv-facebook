# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visit login page', type: :feature do
  scenario 'Login' do
    visit new_user_session_path
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Remember me')
  end
  scenario 'Login with Facebook' do
    visit new_user_session_path
    expect(page).to have_content('Sign in with Facebook')
  end
end
