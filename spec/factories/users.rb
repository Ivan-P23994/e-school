# frozen_string_literal: true

FactoryBot.define do
  factory :user, aliases: %i[lecturer student] do
    # association :lectured_course, factory: :course

    sequence(:id) { |n| n }
    password { '123456' }
    sequence(:email) { |n| "user-#{n}@email.com" }
    sequence(:first_name) { |n| "user#{n}" }
    sequence(:last_name) { |n| "useric#{n}" }
    traits_for_enum(:role, %w[student lecturer])
  end
end
