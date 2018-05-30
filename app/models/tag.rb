class Tag < ActiveRecord::Base
  has_many :prototypes_tag
  has_many :prototypes, through: :prototypes_tag

  # validates :name, presence: true
  #           :check_number_of_tags

 # def check_number_of_tags
 #  if prototype && prototype.tags.count > 3
 #   errors.add(:prototype, "個数OVER")
 #  end
 # end

end


