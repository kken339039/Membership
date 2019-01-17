class Product < ApplicationRecord
  has_many :product_images, dependent: :delete_all
  has_many :images, through: :product_images, source: :image

  validates_presence_of :name, :price
  validates :price, numericality: { only_integer: true }
  validate :validate_images

  def validate_images
    errors.add(:images, "Product images are too much") if images.length > 3
  end
end
