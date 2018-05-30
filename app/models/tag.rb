class Tag < ActiveRecord::Base
  has_many :prototypes_tag
  has_many :prototypes, through: :prototypes_tag
  validates :name, presence: true
  #3つ以上は作れないようにする
end
