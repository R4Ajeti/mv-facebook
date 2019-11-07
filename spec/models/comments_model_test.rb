# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    @user = User.create(email: 'david44444@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.create(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    @comment =
      Comment.new(
        text: 'Text',
        user_id: @user.id,
        post_id: @post.id
      )
    expect(@comment).to be_valid
  end

  it 'is not valid without a text' do
    @user = User.create(email: 'david44444@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.create(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    @comment =
      Comment.new(
        text: '',
        user_id: @user.id,
        post_id: @post.id
      )
    expect(@comment).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @user = User.create(email: 'david44444@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.create(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    @comment =
      Comment.new(
        text: 'Text',
        user_id: nil,
        post_id: @post.id
      )
    expect(@comment).to_not be_valid
  end

  it 'is not valid without a post_id' do
    @user = User.create(email: 'david44444@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    @post =
      Post.create(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
    @comment =
      Comment.new(
        text: 'Text',
        user_id: @user.id,
        post_id: nil
      )
    expect(@comment).to_not be_valid
  end
end
