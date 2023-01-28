FactoryBot.define do
  factory :asset do

    sequence(:id) { |n| n }
    serial { 10000 }
    title { 'Asset' }
    status { 0 }
    location { AssetLocation.new(5).to_s }
    traits_for_enum(:location, %w[storage\ room school\ garden lobby caffeteria])
  end
end