# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post =
      Post.new(
        title: 'Title',
        user_id: @user.id,
        description: 'My description here'
      )
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'title should be present' do
    @post.title = ''
    assert_not @post.valid?
  end

  test 'description should be present' do
    @post.description = ''
    assert_not @post.valid?
  end
end
