class Spot < ApplicationRecord
  has_many_attached :spot_photos
  has_many:reviews, dependent: :destroy
end
