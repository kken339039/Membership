require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before do
    @image = Rack::Test::UploadedFile.new(Rails.root.join("spec/files/images/test.png"))
    @product = FactoryBot.create(:product)
    @new_product = { name: "product_test", price: 2000, image: @image }
  end

  describe "Without login user" do
    it "#list products" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "#get new product" do
      get :new
      expect(response).to have_http_status(302)
    end

    it "#create new product" do
      post :create, params: { product: @new_product }

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

    it "#edit product" do
      get :edit, params: { id: @product.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it "#update product" do
      patch :update, params: { 
                      id: @product.id,
                      product: @new_product.merge(price: 5000)
                    }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "Login as normal user" do
    before do
      normal_login
    end

    it "#list products" do
      get :index
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end

    it "#get new product" do
      get :new
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it "#create new product" do
      post :create, params: { product: @new_product }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

    it "#edit product" do
      get :edit, params: { id: @product.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it "#update product" do
      patch :update, params: { 
                      id: @product.id,
                      product: @new_product.merge(price: 5000)
                    }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end
end
