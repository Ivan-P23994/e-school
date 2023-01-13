# frozen_string_literal: true

require_relative 'value_objects/asset_location'

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

class Asset < ApplicationRecord
  belongs_to :category, inverse_of: :assets

  enum location: AssetLocation::LOCATIONS
  enum :status, ['Checked Out', 'In Storage'], default: 'In Storage'

  validates :serial, :title, :status, :location, presence: true
  validate :stored_correctly?

  def location
    @location ||= AssetLocation.new(read_attribute(:location))
  end

  def stored_correctly?
    return unless status == 'In Storage' && location.location != 'storage room'

    errors.add(:location, 'Location does not correspond with status')
  end
end
