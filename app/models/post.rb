# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user, class_name: 'User'
  has_many :likes, foreign_key: :post_id
  has_many :likers, through: :likes, source: :user
  has_many :comments, foreign_key: :post_id
  has_many :commenters, through: :comments, source: :user
end
