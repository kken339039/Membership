FactoryBot.define do
  factory :user do
    password { Faker::Internet.password(8) }

    trait :admin_user do
      id {1}
      email {"admin@test.com"}
      
      after :build do |user|
        user.roles << FactoryBot.create(:role, :admin_role)
      end
    end

    trait :premium_user do
      id {2}
      email {"premium@test.com"}

      after :build do |user|
        user.roles << FactoryBot.create(:role, :premium_role)
      end
    end

    trait :normal_user do
      id {3}
      email {"normal@test.com"}
    end
  end
end
