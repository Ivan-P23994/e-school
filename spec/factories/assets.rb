# frozen_string_literal: true

# == Schema Information
#
# Table name: assets
#
#  id          :bigint           not null, primary key
#  serial      :integer
#  title       :string
#  status      :integer
#  category_id :bigint           not null
#  location    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :asset do
    sequence(:id) { |n| n }
    serial { 10_000 }
    title { 'Asset' }
    status { 0 }
    location { AssetLocation.new(5).to_s }
    traits_for_enum(:location, ['classroom', 'lobby', 'conference room', 'caffeteria', 'school garden', 'storage room'])
  end
end
