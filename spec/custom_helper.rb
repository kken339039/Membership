module CustomHelper
  def admin_login
    @user = FactoryBot.create(:user, :admin_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    sign_in @user
  end

  def premium_login
    @user = FactoryBot.create(:user, :premium_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    sign_in @user
  end

  def normal_login
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    sign_in @user
  end
end