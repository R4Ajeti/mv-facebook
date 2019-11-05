# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get posts_new_path
    follow_redirect!
    assert_response :success
  end

  test 'should get index' do
    get posts_path
    follow_redirect!
    assert_response :success
  end
end
