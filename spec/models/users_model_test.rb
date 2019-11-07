# frozen_string_literal: true

# https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    @user = User.new(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    expect(@user).to be_valid
  end

  it 'is not valid without a email' do
    @user = User.new(email: '', password: Devise::Encryptor.digest(User, 'helloworld'))
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password' do
    @user = User.new(email: 'david@mail.com', password: '')
    expect(@user).to_not be_valid
  end
end
