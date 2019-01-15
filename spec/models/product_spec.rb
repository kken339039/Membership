require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Model relation' do
    it { should have_many(:product_images) }
    it { should have_many(:images) }
  end

   describe 'Model validation' do
    it 'invalid name' do
      build(:product, {
        name: nil,
        price: 1000
      }).should be_invalid
    end

    it 'invalid price' do
      build(:product, {
        name: Faker::Internet.name,
        price: "xxxxx"
      }).should be_invalid
    end
  end
end
