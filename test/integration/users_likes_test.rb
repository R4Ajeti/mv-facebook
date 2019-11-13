# frozen_string_literal: true

require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test1)
  end

  test 'signed in user adds like' do
    get new_user_session_path
    assert_equal 200, status
    @david = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    post new_user_session_path, params: { user: { email: @david.email, password: @david.password } }
    assert :user_signed_in?
    @post =
      Post.create(
        title: 'Title',
        user_id: @david.id,
        description: 'My description here'
      )
    get like_path(@post.id)
    assert_response :redirect
  end
end
