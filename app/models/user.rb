# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :email, presence: true
  has_many :created_posts, foreign_key: :user_id, class_name: 'Post'
  has_many :likes, foreign_key: :user_id
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, foreign_key: :user_id
  has_many :commented_posts, through: :comments, source: :post
end
