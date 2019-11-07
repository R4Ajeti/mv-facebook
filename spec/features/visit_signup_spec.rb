# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visit signup page', type: :feature do
  scenario 'Signup' do
    visit new_user_registration_path
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password confirmation')
  end
end
