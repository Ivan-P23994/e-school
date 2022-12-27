# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id             :bigint           not null, primary key
#  title          :string
#  description    :text
#  field_of_study :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :course, aliases: [:lectured_course] do
    association :lecturer, factory: :user, role: 'lecturer'

    sequence(:id) { |n| n }
    title { Faker::Science.science(:formal, :applied) }
    description { Faker::Lorem.sentence(word_count: 7) }
    field_of_study { Faker::Science.science(:natural, :applied) }
  end
end
