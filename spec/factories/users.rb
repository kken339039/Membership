FactoryBot.define do
  factory :user do
    password { Faker::Internet.password(8) }
    email { Faker::Internet.email }

    trait :admin_user do
      after :build do |user|
        user.roles << FactoryBot.create(:role, :admin_role)
      end
    end

    trait :premium_user do
      after :build do |user|
        user.roles << FactoryBot.create(:role, :premium_role)
      end
    end
  end
end
