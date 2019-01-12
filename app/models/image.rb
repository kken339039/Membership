class Image < ApplicationRecord
  has_many :product_images, dependent: :destroy
  has_many :products, through: :product_images, source: :product
end
