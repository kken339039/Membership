require 'rails_helper'

RSpec.describe RolesController, type: :controller do  
  describe "Upgrade Premium Role" do
    it "normal user upgrade to premium user" do 
      normal_login
      premium_role = FactoryBot.create(:role, :premium_role)
      get :upgrade_premium
      expect(response).to have_http_status(302)
      expect(@user.roles).to include(premium_role)
    end

    it "admin user upgrade to premium user" do 
      admin_login
      premium_role = FactoryBot.create(:role, :premium_role)
      get :upgrade_premium
      expect(response).to have_http_status(302)
      expect(@user.roles).to include(premium_role)
    end
  end
end
