FactoryBot.define do
  factory :course do
    sequence(:id) { |n| n }
    first_name { Faker::Science.science(:formal, :applied) }
    last_name { Faker::Lorem.sentence(word_count: 7) }
    field_of_study { Faker::Science.science(:natural, :applied) }
  end
end