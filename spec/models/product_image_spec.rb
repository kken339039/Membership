require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  describe 'Model relation' do
    it { should belong_to(:product) }
    it { should belong_to(:image) }
  end

  describe 'Model validation' do
    it "uniqueness" do
      create(:product, id: 1)
      create(:image, id: 1)
      expect(create(:product_image)).to validate_uniqueness_of(:product_id).scoped_to(:image_id)
    end
  end
end
