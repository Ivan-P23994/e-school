# frozen_string_literal: true

class AssetLocation
  attr_reader :location

  LOCATIONS = { classroom: 0, lobby: 1, "conference room": 2,
                caffeteria: 3, "school garden": 4, "storage room": 5 }.freeze

  def initialize(location)
    @location = location
  end

  def to_s
    @location
  end
end
