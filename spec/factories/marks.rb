FactoryBot.define do
  factory :mark do

    sequence(:id) { |n| n }
    comment { 'Random comment for mark category' }
    traits_for_enum(:grade_point, %w[A A- B+ B C+ C F])
    mark {0...100}

  end
end