# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visit home page', type: :feature do
  scenario 'Home without auth' do
    visit root_path
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end
end
