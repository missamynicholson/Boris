require_relative 'docking_station'

class Van

  attr_reader :docking_station

  def station(dockingstation)
    @docking_station = dockingstation
  end

  def collect_broken_bikes
    @docking_station.sort_broken_bikes
  end
end