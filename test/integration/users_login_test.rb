# frozen_string_literal: true

require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test1)
  end

  test 'signed in user is redirected to root_path' do
    get new_user_session_path
    assert_equal 200, status
    @david = User.create(email: 'david@mail.com', password: Devise::Encryptor.digest(User, 'helloworld'))
    post new_user_session_path, params: { user: { email: @david.email, password: @david.password } }
    # post new_user_session_path 'user[email]' => @david.email, 'user[password]' =>  @david.password
    follow_redirect!
    assert_equal 200, status
    assert_equal '/', path
  end

  test 'user is redirected to sign in page when visiting home page' do
    get '/'
    assert_equal 302, status
    follow_redirect!
    assert_equal new_user_session_path, path
    assert_equal 200, status
  end
end
