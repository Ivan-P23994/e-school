class AssetLocation
  LOCATIONS = { classroom: 0, lobby: 1, :"conference room" => 2,
  caffeteria: 3, :"school garden" => 4}.freeze

  def initialize(location)
    @location = location
  end

  def to_s
    @location
  end
end