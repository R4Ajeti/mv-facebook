# frozen_string_literal: true

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'valid signup information' do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post '/users', params: { user: { email: 'user@example.com',
                                       password: 'justpassword',
                                       password_confirmation: 'justpassword' } }
    end
    assert :user_signed_in?
  end
end
