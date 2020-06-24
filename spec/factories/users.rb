FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@email.com"}
    password { "password" }
    first_name { "firstname" }
    last_name { "lastname" }
  end
end
