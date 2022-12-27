# frozen_string_literal: true

FactoryBot.define do
  factory :course, aliases: [:lectured_course] do
    association :lecturer, factory: :user, role: 'lecturer'

    sequence(:id) { |n| n }
    title { Faker::Science.science(:formal, :applied) }
    description { Faker::Lorem.sentence(word_count: 7) }
    field_of_study { Faker::Science.science(:natural, :applied) }
  end
end
