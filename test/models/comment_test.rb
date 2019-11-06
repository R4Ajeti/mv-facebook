# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = posts(:one)
    @comment =
      Comment.new(
        user_id: @user.id,
        post_id: @post.id,
        text: 'text'
      )
  end

  test 'should be valid' do
    assert @comment.valid?
  end

  test 'post_id should be present' do
    @comment.post_id = nil
    assert_not @comment.valid?
  end

  test 'user_id should be present' do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test 'text should be present' do
    @comment.text = nil
    assert_not @comment.valid?
  end
end
