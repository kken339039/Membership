require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "Admin user" do
    before do
      admin_login
      @normal_user = create(:user)
      @admin_user = FactoryBot.create(:user)
      @admin_user.roles << Role.find_by(name: "admin")
    end

    it "#index" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "#promotion" do
      post :promote, params: { user_id: @normal_user.id }
      result = @normal_user.is_admin?
      expect(result).to eq(true)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(users_url)
    end

    it "#demotion cueent_user and promoted_user" do
      delete :demote, params: { user_id: @admin_user.id }
      result = @admin_user.is_admin?
      expect(result).to eq(false)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(users_url)

      delete :demote, params: { user_id: @user.id }
      result = @user.is_admin?
      expect(result).to eq(true)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(users_url)
    end
  end
end
