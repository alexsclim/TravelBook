class Picture < ApplicationRecord
  belongs_to :location

  has_attached_file :image, styles: {
    thumb: '100x100>',
    small: '150x150>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
