FactoryBot.define do
  factory :asset do

    sequence(:id) { |n| n }
    serial { 10000 }
    title { 'Asset' }
    status { 0 }
    location { AssetLocation.new(5).to_s }
  end
end