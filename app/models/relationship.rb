class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  #These validations are not mandotory since rails 5
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
