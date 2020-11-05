class Opinion < ApplicationRecord
  validates :Text, presence: true, length: { maximum: 200,
                                                too_long: 'Your opinion should be a maximum of 200 characters.' }

  belongs_to :author, class_name: 'User', foreign_key: 'AuthorId'
  has_many :likes
end
