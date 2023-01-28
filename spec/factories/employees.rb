# frozen_string_literal: true

# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  position   :string
#  team_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :employee do
    sequence(:id) { |n| n }
    sequence(:email) { |n| "employee-#{n}@email.com" }
    sequence(:first_name) { |n| "employee#{n}" }
    sequence(:last_name) { |n| "employee#{n}" }
    position { 'worker' }
  end
end
