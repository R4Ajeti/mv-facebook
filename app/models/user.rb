# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  validates :email, presence: true
  has_many :created_posts, foreign_key: :user_id, class_name: 'Post'
  has_many :likes, foreign_key: :user_id
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, foreign_key: :user_id
  has_many :commented_posts, through: :comments, source: :post

  has_many :requested_friendships, foreign_key: :user_id, class_name: 'Friendship'
  has_many :received_friendships, foreign_key: :friend_id, class_name: 'Friendship'
  has_many :requested_friends, through: :requested_friendships, source: :friend
  has_many :received_friends, through: :received_friendships, source: :user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      #     # uncomment the line below to skip the confirmation emails.
      #         # user.skip_confirmation!
    end
  end

  #def self.new_with_session(params, session)
  #  super.tap do |user|
  #    if data == session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
  #      user.email = data['email'] if user.email.blank?
  #    end
  #  end
  #end
end
