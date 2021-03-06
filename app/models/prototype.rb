class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :prototypes_tag, dependent: :destroy
  has_many :tags, through: :prototypes_tag, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates_length_of :tags, maximum: 2

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  accepts_nested_attributes_for :tags

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
