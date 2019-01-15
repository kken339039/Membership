require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "Admin user" do
    before do
      admin_login
      @normal_user = create(:user)
    end

    it "#index" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "#promotion" do
      post :promote, params: { user_id: @normal_user.id }
      result = @normal_user.has_role?(:admin)
      expect(result).to eq(true)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(users_url)
    end

    it "#demote admin_user" do
      admin_user = FactoryBot.create(:user)
      admin_user.roles << Role.find_by(name: "admin")

      delete :demote, params: { user_id: admin_user.id }
      result = admin_user.has_role?(:admin)
      expect(result).to eq(false)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(users_url)
   end

   it "#demote last_admin_user" do
      delete :demote, params: { user_id: @user.id }
      result = @user.has_role?(:admin)
      expect(result).to eq(true)
      expect(flash[:alert]).to eq("Demote fail, #{@user.email} is last Admin user!" )
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(users_url)
    end
  end

  describe "Normal user" do
    before do
      normal_login
    end

    it "#index" do
      get :index
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it "#promotion" do
      post :promote, params: { user_id: @user.id }
      expect(flash[:alert]).to eq("You are not Admin user, not allow to access this page")
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end

    it "#demotion" do
      post :demote, params: { user_id: @user.id }
      expect(flash[:alert]).to eq("You are not Admin user, not allow to access this page")
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_url)
    end
  end
end
