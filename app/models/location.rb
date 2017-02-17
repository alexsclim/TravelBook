class Location < ApplicationRecord
  validates :address,
            :latitude,
            :longitude,
            presence: true

  belongs_to :user
  has_many :pictures, dependent: :destroy
end
