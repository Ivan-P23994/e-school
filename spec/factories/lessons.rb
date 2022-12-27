FactoryBot.define do
  factory :lesson do
    sequence(:id) { |n| n }
    first_name { Faker::Science.science(:formal, :applied) }
    last_name { Faker::Lorem.sentence(word_count: 7) }
  end
end