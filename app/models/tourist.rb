class Tourist < ApplicationRecord
    belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  def already_liked?(tourist)
    self.likes.exists?(tourist_id: tourist.id)
  end

    mount_uploader :image, ImageUploader
end
