FactoryBot.define do
    factory :punch_card do
      association :user, factory: :user
    end
  end
  