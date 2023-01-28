# frozen_string_literal: true

# == Schema Information
#
# Table name: marks
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  course_id   :bigint           not null
#  comment     :string
#  mark        :integer
#  grade_point :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :mark do
    sequence(:id) { |n| n }
    comment { 'Random comment for mark category' }
    traits_for_enum(:grade_point, %w[A A- B+ B C+ C F])
    mark { 0...100 }
  end
end
