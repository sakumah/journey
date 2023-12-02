class Like < ApplicationRecord
  belongs_to :tourist
  belongs_to :user

  validates_uniqueness_of :tourist_id, scope: :user_id

end
