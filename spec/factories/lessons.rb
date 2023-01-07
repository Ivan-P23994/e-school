# frozen_string_literal: true

# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint           not null
#
FactoryBot.define do
  factory :lesson do
    sequence(:id) { |n| n }
    title { Faker::Science.science(:formal, :applied) }
    description { Faker::Lorem.sentence(word_count: 7) }
  end
end
