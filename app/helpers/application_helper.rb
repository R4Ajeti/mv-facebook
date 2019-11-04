# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title)
    base_title = 'Facebook'
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end
end
