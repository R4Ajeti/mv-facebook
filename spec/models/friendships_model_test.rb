# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'is valid with valid attributes' do
    @user = User.create(email: 'david44444@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @friend = User.create(email: 'david44445@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @friendship =
      Friendship.new(
        confirmed: true,
        user_id: @user.id,
        friend_id: @friend.id
      )
    expect(@friendship).to be_valid
  end

  it 'is not valid without a user_id' do
    @user = User.create(email: 'david44444@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @friend = User.create(email: 'david44445@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @friendship =
      Friendship.new(
        confirmed: true,
        user_id: nil,
        friend_id: @friend.id
      )
    expect(@friendship).to_not be_valid
  end

  it 'is not valid without a freind_id' do
    @user = User.create(email: 'david44444@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @friend = User.create(email: 'david44445@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @friendship =
      Friendship.new(
        confirmed: true,
        user_id: @user.id,
        friend_id: nil
      )
    expect(@friendship).to_not be_valid
  end
end
