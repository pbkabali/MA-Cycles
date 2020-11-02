class User < ApplicationRecord

  validates :Username, presence: true, length: { maximum: 12 }, uniqueness: true

  has_many :opinions, dependent: :destroy
  has_many :follower_relationships, foreign_key: 'FollowedId', class_name: 'Following'
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: 'FollowerId', class_name: 'Following'
  has_many :following, through: :following_relationships, source: :followed
end
