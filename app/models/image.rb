class Image < ApplicationRecord
  has_many :product_images, dependent: :delete_all
  has_many :products, through: :product_images, source: :product

  mount_uploader :image, ImageUploader
end
