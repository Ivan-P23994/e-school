# == Schema Information
#
# Table name: assets
#
#  id          :bigint           not null, primary key
#  serial      :integer
#  title       :string
#  Status      :integer
#  category_id :bigint           not null
#  location    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require_relative 'value_objects/asset_location'

class Asset < ApplicationRecord
  belongs_to :category, inverse_of: :assets

  enum location: AssetLocation::LOCATIONS

  def location
    @location ||= AssetLocation.new(read_attribute(:location))
  end
end
