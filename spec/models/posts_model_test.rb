# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    @user = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.new(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    expect(@post).to be_valid
  end

  it 'is not valid without a title' do
    @user = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.new(
        title: '',
        user_id: @user.id,
        description: 'My description here'
      )
    expect(@post).to_not be_valid
  end

  it 'is not valid without a description' do
    @user = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.new(
        title: 'Title',
        user_id: @user.id,
        description: ''
      )
    expect(@post).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @post =
      Post.new(
        title: 'Title',
        user_id: nil,
        description: 'Description'
      )
    expect(@post).to_not be_valid
  end
end
