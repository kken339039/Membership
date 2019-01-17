class ProductsController < ApplicationController
  before_action :authorize_admin, except: [:index]
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all.order(id: :DESC).page(params[:page]).per(6)
  end

  def new
    @product = Product.new
  end

  def create
    begin
      @product = Product.create!(product_params)
      save_image
      flash[:notice] = "Create New Product Success"
      redirect_to root_path
    rescue => e
      flash[:alert]= e.message
      redirect_back(fallback_location: new_product_path)
    end
  end

  def update
    begin
      @product.update!(product_params)
      save_image
      flash[:notice] = "Update Product Success"
      redirect_to root_path
    rescue => e
      # binding.pry
      flash[:alert] = e.message
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
    return if params[:product][:image].nil?

    product_images =  @product.images 
    image = Image.create!(params.require(:product).permit(:image))
    @product.images  << image
  end
end
