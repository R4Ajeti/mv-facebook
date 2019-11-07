# frozen_string_literal: true

# https://relishapp.com/rspec/rspec-rails/v/3-9/docs/feature-specs/feature-spec

require 'rails_helper'

RSpec.feature 'User login', type: :feature do
  before :each do
    @david = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    login_as @david
  end

  scenario 'Visit profile after login' do
    visit "/users/#{@david.id}"
    expect(page).to have_text('Friends')
  end
end
