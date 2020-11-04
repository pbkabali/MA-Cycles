class User < ApplicationRecord

  validates :Username, presence: true, length: { maximum: 12 }, uniqueness: true
  validates :FullName, presence: true, length: { maximum: 30 }

  has_many :opinions, foreign_key: 'AuthorId', dependent: :destroy
  has_many :follower_relationships, foreign_key: 'FollowedId', class_name: 'Following', dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: 'FollowerId', class_name: 'Following', dependent: :destroy
  has_many :following, through: :following_relationships, source: :followed
end
