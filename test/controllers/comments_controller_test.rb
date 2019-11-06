# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @post = posts(:one)
    @comment =
      Comment.new(
        user_id: @user.id,
        post_id: @post.id,
        text: '123'
      )
  end

  test 'should get login' do
    post comment_path(@post.id)
    follow_redirect!
    assert_response :success
  end
end
