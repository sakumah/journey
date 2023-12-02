class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :tourists, dependent: :destroy 
         validates :name, presence: true 
         validates :profile, length: { maximum: 200 } 
         has_many :likes, dependent: :destroy
         has_many :liked_tourists, through: :likes, source: :tourist
         mount_uploader :image, ImageUploader  
         
         def already_liked?(tourist)
          self.likes.exists?(tourist_id: tourist.id)
         end

end
