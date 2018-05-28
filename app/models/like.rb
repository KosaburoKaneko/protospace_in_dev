class Like < ActiveRecord::Base
  belongs_to :user
  belomgs_to :prototype, counter_cache: :likes_count
  validates :user_id, presence: true
  validates :prototypes_id, presence: true
end
