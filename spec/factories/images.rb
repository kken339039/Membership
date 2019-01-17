FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec/files/images/test.png")) }
  end
end
