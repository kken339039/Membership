class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  has_many :images, through: :product_images, source: :image

  validates_presence_of :name, :price
end
