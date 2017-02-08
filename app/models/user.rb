class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def following_paginate(page)
    following.paginate(page: page, per_page: 7).order(:first_name)
  end

  def followers_paginate(page)
    followers.paginate(page: page, per_page: 7).order(:first_name)
  end

  def self.search(search, page)
    if search
      where("first_name ILIKE ? OR last_name ILIKE ?", "%#{search}%", "%#{search}%").paginate(page: page, per_page: 7).order(:first_name)
    else
      paginate(page: page, per_page: 7).order(:first_name)
    end
  end
end
