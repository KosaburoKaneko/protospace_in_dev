class Like < ActiveRecord::Base
  belongs_to :user
  belomgs_to :prototypes
  validates :user_id, presence: true
  validates :prototypes_id, presence: true
end
