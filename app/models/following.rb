class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'FollowerId'
  belongs_to :followed, class_name: 'User', foreign_key: 'FollowedId'

  validate :cannot_follow_self

  private

  def cannot_follow_self
    errors.add(:followed, 'You cannot follow yourself.') if follower == followed
  end
end
