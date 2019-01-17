class ProductsController < ApplicationController
  before_action :authorize_admin, except: [:index]
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all.order(id: :DESC)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create!(product_params)
    mes = "Create New Product"
    if @product
      save_image
      flash[:notice] = mes + " Success"
      redirect_to root_path
    else
      flash[:alert] = mes + " Fail"
      redirect_back(fallback_location: new_product_path)
    end
  end

  def update
    mes = "Update Product"
    if @product.update!(product_params)
      save_image
      flash[:notice] = mes + " Success"
      redirect_to root_path
    else
      flash[:alert] = mes + " Fail"
      redirect_back(fallback_location: edit_product_path)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

  def set_product
    @product = Product.includes(:images).find(params[:id])
  end

  def save_image
    
    image = Image.create!(params.require(:product).permit(:image))
    product_images =  @product.images 

    product_images << image
    product_images.delete(product_images.first.id) if product_images.length > 3 
  end
end
