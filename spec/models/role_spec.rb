require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'Model relation' do
    it { should have_many(:user_roles) }
    it { should have_many(:users) }
  end

  describe 'Model validation' do
    it 'unique role name' do
      role = Faker::Name.name
      exist_role = create(:role, name: role)
      build(:role, name: role).should be_invalid
    end
  end
end
