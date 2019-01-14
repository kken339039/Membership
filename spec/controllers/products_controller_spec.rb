require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product)
    @image = Rack::Test::UploadedFile.new(Rails.root.join("spec/files/images/test.png"))
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
      post :create, params: { 
                      product: { 
                        name: "product_test", 
                        price: 2000, 
                        image: @image
                        }
                      }

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
                      product: { 
                        name: "test",
                        price: 5000, 
                        image: @image 
                        } 
                      }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end
end
