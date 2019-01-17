require 'rails_helper'

RSpec.describe UsersRole, type: :model do
  describe 'Model relation' do
    it { should belong_to(:user) }
    it { should belong_to(:role) }
  end

  describe 'Model validation' do
    it "uniqueness" do
      create(:user, id: 1)
      create(:role, id: 1)
      expect(create(:users_role)).to validate_uniqueness_of(:user_id).scoped_to(:role_id)
    end
  end
end
