# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    @user = User.create(email: 'david44419@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.create(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    @like =
      Like.new(
        user_id: @user.id,
        post_id: @post.id
      )
    expect(@like).to be_valid
  end

  it 'is not valid without a user_id' do
    @user = User.create(email: 'david44421@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.create(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    @like =
      Like.new(
        user_id: nil,
        post_id: @post.id
      )
    expect(@like).to_not be_valid
  end

  it 'is not valid without a post_id' do
    @user = User.create(email: 'david44422@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.create(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    @like =
      Like.new(
        user_id: @user.id,
        post_id: nil
      )
    expect(@like).to_not be_valid
  end
end
