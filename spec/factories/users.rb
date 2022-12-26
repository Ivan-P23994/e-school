FactoryBot.define do
  factory :user, aliases: [:lecturer, :student] do
    sequence(:id) { |n| n }
    password {  "123456" }
    sequence(:email) { |n| "user-#{n}@email.com" }
    sequence(:first_name) { |n| "user#{n}" }
    sequence(:last_name) { |n| "useric#{n}" }

  end
end