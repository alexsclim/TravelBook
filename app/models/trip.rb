class Trip < ApplicationRecord
  validates :title,
            presence: true

  belongs_to :user
  has_many :locations, dependent: :nullify
end
