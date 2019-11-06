# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @post = posts(:one)
    @like =
      Like.new(
        user_id: @user.id,
        post_id: @post.id
      )
  end

  test 'should get login' do
    get like_path(@post.id)
    follow_redirect!
    assert_response :success
  end
end
