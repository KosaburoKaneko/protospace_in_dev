class PrototypesTag < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :tag

  # validates :prototype_id, presence: true
  #           :check_number_of_prototypes_tags

 # def check_number_of_prototypes_tags
 #  if prototype && prototype.prototypes_tags.count > 3
 #   errors.add(:prototype, "個数OVER")
 #  end
 # end

end
