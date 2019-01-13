class Product < ApplicationRecord
  has_many :product_images, dependent: :delete_all
  has_many :images, through: :product_images, source: :image

  validates_presence_of :name, :price
end
