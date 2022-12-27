# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    sequence(:id) { |n| n }
    title { Faker::Science.science(:formal, :applied) }
    description { Faker::Lorem.sentence(word_count: 7) }
  end
end
