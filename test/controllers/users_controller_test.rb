# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_registration_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_registration_path
    follow_redirect!
    assert_response :success
  end
end
