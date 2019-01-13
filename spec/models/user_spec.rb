require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model relation' do
    it { should have_many(:user_roles) }
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

      it 'exist?' do
        expect(@user).to respond_to(:is_admin?)
      end

      describe 'user validate' do
        it 'normal user' do
          expect(@user.is_admin?).to eq(false)
        end

        it 'admin user' do
          @user.roles << FactoryBot.create(:role, :admin_role)
          expect(@user.is_admin?).to eq(true)
        end

        it 'premium user' do
          @user.roles << FactoryBot.create(:role, :premium_role)
          expect(@user.is_admin?).to eq(false)
        end
      end
    end

    describe '#is_premium?' do
      before do
        @user = FactoryBot.create(:user)
      end

      it 'exist?' do
        expect(@user).to respond_to(:is_premium?)
      end

      describe 'user validate' do
        it 'normal user' do
          expect(@user.is_premium?).to eq(false)
        end

        it 'admin user' do
          @user.roles << FactoryBot.create(:role, :admin_role)
          expect(@user.is_premium?).to eq(false)
        end

        it 'premium user' do
          @user.roles << FactoryBot.create(:role, :premium_role)
          expect(@user.is_premium?).to eq(true)
        end
      end
    end
  end
end
