class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :locations, dependent: :destroy
  has_many :trips, dependent: :destroy
end
