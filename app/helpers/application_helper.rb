# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title)
    base_title = 'Facebook'
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end

  def requests(user)
    @n = Friendship.all.select do |friendship|
      requested = user.requested_friends.map(&:id)
      friendship.friend_id == user.id && !requested.include?(friendship.user_id)
    end
  end
end
