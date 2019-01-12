class ProductImage < ApplicationRecord
  belongs_to :product
  belongs_to :image
  validates_uniqueness_of :product_id, :scope => :image_id
end
