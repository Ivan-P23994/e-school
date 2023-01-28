# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "employee-#{n}@email.com" }
    sequence(:first_name) { |n| "employee#{n}" }
    sequence(:last_name) { |n| "employee#{n}" }
    position { 'worker' }
  end
end
