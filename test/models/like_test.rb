# frozen_string_literal: true

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = posts(:one)
    @like =
      Like.new(
        user_id: @user.id,
        post_id: @post.id
      )
  end

  test 'should be valid' do
    assert @like.valid?
  end

  test 'post_id should be present' do
    @like.post_id = nil
    assert_not @like.valid?
  end

  test 'user_id should be present' do
    @like.user_id = nil
    assert_not @like.valid?
  end
end
