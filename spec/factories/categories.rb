FactoryBot.define do
  factory :category do

    sequence(:id) { |n| n }
    category { 'electronics' }

  end
end