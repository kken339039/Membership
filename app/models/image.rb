class Image < ApplicationRecord
  has_many :product_images, dependent: :destroy
  has_many :products, through: :product_images, source: :product

  mount_uploader :file, FileUploader

  private
  def product_params
    params.require(:images).permit(:file)
  end
end
