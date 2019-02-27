class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true # unnecessary as of Rails 5, left for completeness
  validates :followed_id, presence: true # unnecessary as of Rails 5, left for completeness
end
