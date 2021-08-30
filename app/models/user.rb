# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :active_favorites,  class_name: 'favorite',
                                   foreign_key: 'follower_id',
                                   dependent: :destroy,
                                   inverse_of: :follower
  has_many :passive_favorites, class_name: 'favorite',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy,
                                   inverse_of: :followed
  has_many :following, through: :active_favorites,  source: :followed
  has_many :followers, through: :passive_favorites, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーのフォローを解除する
  def unfollow(other_user)
    active_favorites.find_by!(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
end
