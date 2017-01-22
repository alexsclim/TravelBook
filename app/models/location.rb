class Location < ApplicationRecord
  validates :address,
            :latitude,
            :longitude,
            presence: true

  belongs_to :user, dependent: :destroy
end