FactoryBot.define do
  factory :role do
    trait :admin_role do
      id {1}
      name {"admin"}
    end

    trait :premium_role do
      id {2}
      name {"premium"}
    end

    trait :normal_role do
      id {3}
      name {"normal"}
    end
  end
end
