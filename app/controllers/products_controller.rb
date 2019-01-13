class ProductsController < ApplicationController
  before_action :authorize_admin, except: [:index]

  def index
    @products = Product.all.order(id: :DESC)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.create!(product_params)
    mes = "Create New Product"
    if @product
      flash[:notice] = mes + " Success"
      redirect_to root_path
    else
      flash[:alert] = mes + " Fail"
      redirect_back(fallback_location: new_product_path)
    end
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :image)
  end
end
