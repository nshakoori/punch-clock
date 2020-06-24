FactoryBot.define do
    factory :punch_record do
      punch_in { "2020-01-01 12:00:00" }
      association :punch_card, factory: :punch_card
    end
  end
  