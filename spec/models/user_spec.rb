require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model relation' do
    it { should have_many(:users_roles) }
    it { should have_many(:roles) }
  end

  describe 'Model validation' do
    it 'invalid password' do
      password = 'aaa'
      build(:user, {
        email: Faker::Internet.email,
        password: password,
        password_confirmation: password
      }).should be_invalid
    end

    it 'invalid email' do
      password = 'aaa'
      build(:user, {
        email: 'aaa123@',
        password: password,
        password_confirmation: password
      }).should be_invalid
    end

    it 'unique email address' do
      email = Faker::Internet.email
      exist_user = create(:user, email: email)
      build(:user, email: email).should be_invalid
    end
  end

  describe 'Methods' do
    describe '#is_admin?' do
      before do
        @user = FactoryBot.create(:user)
      end

      describe 'user validate' do
        it 'normal user' do
          expect(@user.has_role?(:admin)).to eq(false)
        end

        it 'admin user' do
          @user.roles << FactoryBot.create(:role, :admin_role)
          expect(@user.has_role?(:admin)).to eq(true)
        end

        it 'premium user' do
          @user.roles << FactoryBot.create(:role, :premium_role)
          expect(@user.has_role?(:admin)).to eq(false)
        end
      end
    end

    describe '#is_premium?' do
      before do
        @user = FactoryBot.create(:user)
      end

      describe 'user validate' do
        it 'normal user' do
          expect(@user.has_role?(:premium)).to eq(false)
        end

        it 'admin user' do
          @user.roles << FactoryBot.create(:role, :admin_role)
          expect(@user.has_role?(:premium)).to eq(false)
        end

        it 'premium user' do
          @user.roles << FactoryBot.create(:role, :premium_role)
          expect(@user.has_role?(:premium)).to eq(true)
        end
      end
    end
  end
end
