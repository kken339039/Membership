require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  describe 'Model relation' do
    it { should belong_to(:product) }
    it { should belong_to(:image) }
  end
end
