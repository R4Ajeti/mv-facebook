# frozen_string_literal: true

# https://relishapp.com/rspec/rspec-rails/v/3-9/docs/feature-specs/feature-spec

require 'rails_helper'

RSpec.feature 'Notifications', type: :feature do
  before :each do
    @friend = User.create(email: 'friend@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @david = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    login_as @david
  end

  scenario 'Visit notifications after login' do
    visit '/friendships'
    expect(page).to have_text('All requests')
  end
end
