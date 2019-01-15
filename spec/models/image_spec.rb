require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Model relation' do
    it { should have_many(:product_images) }
    it { should have_many(:products) }
  end
end
