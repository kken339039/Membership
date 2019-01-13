require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model relation' do
    it { should have_many(:user_roles) }
    it { should have_many(:roles) }
  end
end
